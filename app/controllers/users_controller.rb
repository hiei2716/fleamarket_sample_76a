class UsersController < ApplicationController
  def index
    @iuser = @user.items
  end

  def show
    @items = @user.items
  end

end
