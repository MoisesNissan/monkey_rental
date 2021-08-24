class MonkeysController < ApplicationController
  def my_monkeys
    #@monkeys = current_user.monkeys
  end

  def index
    @monkeys = Monkey.all
  end

  def show
    @monkey = Monkey.find(params[:id])
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