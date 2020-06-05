class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @books_owner = Book.where(owner: current_user)
        @books_rent = @user.rentals_as_rentee
        authorize @user
    end
end
