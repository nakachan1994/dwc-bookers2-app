class UsersController < ApplicationController
  def index
    @newbook = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @newbook = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

end
