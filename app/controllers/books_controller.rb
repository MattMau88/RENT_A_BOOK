class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  # A user can see the list of books
  # GET "books"
  def index
    @books = policy_scope(Book)
    if params[:query].present?
      @books = @books.search_by_title_and_author(params[:query])
    end
  end

  # A user can create a new book: GET + POST
  # GET "books/new"
  def new
    @book = Book.new
    authorize @book
  end
  # POST "books"
  def create
    @book = Book.new(book_params)
    authorize @book
    @book.owner = current_user
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
    @rental = Rental.new
    authorize @book
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    authorize @book
    @book.update(book_params)
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    authorize @book
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully deleted.'
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :category, :rental_fee_per_day, :photo)
  end

  def set_book
    @book = Book.find(params[:id])
    authorize @book
  end
end
