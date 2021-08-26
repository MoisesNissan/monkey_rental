class MonkeysController < ApplicationController
  def my_monkeys
    @monkeys = current_user.monkeys
  end

  def index
    if params[:query].present?
      @monkeys = Monkey.global_search(params[:query])
    else
      @monkeys = Monkey.all
    end
    @markers = @monkeys.geocoded.map do |monkey|
      {
        lat: monkey.lat,
        lng: monkey.lng,
        info_window: render_to_string(partial: "info_window", locals: { monkey: monkey })
      }
    end
  end

  def show
    @monkey = Monkey.find(params[:id])
    @rental = Rental.new
  end

  def new
    @monkey = Monkey.new
  end

  def create
    @monkey = Monkey.new(monkey_params)
    @monkey.user = current_user
    if @monkey.save
      redirect_to monkeys_path
    else
      render :new
    end
  end

  private

  def monkey_params
    params.require(:monkey).permit(:name, :species, :age, :weight, :price, :address, :lat, :lng, :photo)
  end
end
