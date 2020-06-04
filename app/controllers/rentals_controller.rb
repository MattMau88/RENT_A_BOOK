class RentalsController < ApplicationController
    before_action :set_rental, only: [:show]
    before_action :set_book, only: [:new, :create]
    # A user can see the list of rentals
    def index
      @rentals = current_user.rentals
    end


    # POST "rental"
    def create
      @rental = Rental.new(rental_params)
      @rental.rentee = current_user
      @rental.book = @book
      if @rental.save
        redirect_to @rental
      else
        render 'new'
      end
    end

    # A user can see any rental page
    # GET "rentals/id"
    def show
      @rental = Rental.find(params[:id])
    end

    def destroy
      @rental = Rental.find(params[:id])
      @rental.destroy
      redirect_to rentals_path, notice: 'Book Rental was successfully deleted.'
    end

    private
    def set_rental
        @rental = Rental.find(params[:id])
    end

    def set_book
        @book = Book.find(params[:book_id])
    end

    def rental_params
      params.require(:rental).permit(:pickup_date, :return_date, :pickup_location)
    end

  end
