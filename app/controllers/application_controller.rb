class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :set_category

  protected

  def set_category
    @parents = Category.where(ancestry: nil)
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
end
