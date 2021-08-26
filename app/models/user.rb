class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :monkeys, dependent: :destroy
  has_many :rentals, dependent: :destroy

  def rented_monkeys
    rentals = self.rentals
    monkeys = []
    rentals.each do |rental|
      monkeys << rental.monkey
    end

    return monkeys
  end
end
