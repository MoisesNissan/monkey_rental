class RentalsController < ApplicationController
  def create
    @rental = Rental.new(rental_params)
    @monkey = Monkey.find(params[:monkey_id])
    @rental.user = current_user
    @rental.monkey = @monkey
    if @rental.save
      # TODO: SEND TO USER RENTALS or SUCCESS PAGE
      redirect_to confirm_path(@rental)
    else
      render "monkeys/show"
    end
  end

  def confirmation
    @rental = Rental.find(params[:format])
  end

  private



  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
