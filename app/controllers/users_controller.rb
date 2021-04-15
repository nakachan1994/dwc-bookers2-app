class UsersController < ApplicationController
  def index
    @newbook = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
end
