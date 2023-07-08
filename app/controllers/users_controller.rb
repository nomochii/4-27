class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     flash[:success] = 'Welcome! You have signed up successfully.'
  #     redirect_to login_path
  #   else
  #     render :new
  #   end
  # end

  def index
    @user = current_user
    @users = User.all
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
