class RentalsController < ApplicationController
  def create
    @rental = Rental.new(rental_params)
    @monkey = Monkey.find(params[:monkey_id])
    @rental.user = current_user
    @rental.monkey = @monkey
    if @rental.save
      # TODO: SEND TO USER RENTALS or SUCCESS PAGE
      redirect_to monkeys_path, notice: "Your monkey has been successfully booked!"
    else
      render "monkeys/show"
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
