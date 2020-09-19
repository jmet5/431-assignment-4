class BooksController < ApplicationController

  before_action :current_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.create(book_params)
    flash[:notice] = "Book created successfully."
    redirect_to books_path
  end

  def edit
  end

  def update
    @book.update(book_params)
    flash[:notice] = "Book updated successfully."
    redirect_to book_path(@book)
  end

  def destroy
    @book.destroy
    flash[:notice] = "Book deleted successfully."
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :price, :date)
  end

  def current_book
    @book = Book.find(params[:id])
  end
end
