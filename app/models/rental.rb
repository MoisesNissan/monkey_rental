class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :monkey

  validates :start_date, :end_date, presence: true
end
