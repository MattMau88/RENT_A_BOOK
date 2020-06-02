class BooksController < ApplicationController

  # A user can see the list of books
  # GET "books"
  def index
    @books = Book.all
  end

  # A user can create a new book: GET + POST
  # GET "books/new"
  def new
    @book = Book.new
  end
  # POST "books"
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  # A user can see any book page
  # GET "books/id"
  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :category, :rental_fee_per_day, :photo)
  end

end
