class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :set_categories, only: [:edit, :update]

  private

  def set_categories
    @categories = CategoryAncestry.where(ancestry: nil)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
end
