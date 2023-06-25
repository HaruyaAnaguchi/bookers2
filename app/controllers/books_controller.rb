class BooksController < ApplicationController

  before_action :authenticate_user!

  def create
    @book = Book.new(book_params)
    @user = User.find(current_user.id)
    @book.user_id = current_user.id
    @books = Book.all
   if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
   else
     render :index
   end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def show
    @book = Book.new
    @post_book = Book.find(params[:id])
    @user = User.find(@post_book.user.id)
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
end