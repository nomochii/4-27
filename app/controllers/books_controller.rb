class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    #@newbook = Book.new
    if @newbook.save
      redirect_to  book_path(@newbook.id)
      flash[:notice] = 'You have created book successfully.'
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end


  def index
    @user = current_user
    @users = User.all
    @books = Book.all
    @newbook = Book.new

  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

end

