class RentalsController < ApplicationController
  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.monkey = Monkey.find(params[:monkey_id])
    if @rental.save
      redirect_to rental_path(@rental)
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
