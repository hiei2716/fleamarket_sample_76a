class UsersController < ApplicationController
  before_action :set_user_params, only: [:show, :edit, :update]
  before_action :set_user_current, only: [:index, :edit_detail, :update_detail]

  private
  
  def set_user_params
    @user = User.find(params[:id])
  end

  def set_user_current
    @user = User.find(current_user.id)
  end

end
