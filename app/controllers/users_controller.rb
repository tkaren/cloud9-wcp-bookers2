class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only:[:update, :edit]
  
  def show
    @user = User.find(params[:id])
    #@books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully"
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end
  
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def correct_user
    @user = User.find(params[:id])
     unless @user == current_user
       redirect_to user_path
     end
  end
  
end
