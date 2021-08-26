class Monkey < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :rentals, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  geocoded_by :address, latitude: :lat, longitude: :lng
  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :name, :address, :price, :species, :age ],
  using: {
    tsearch: { prefix: true }
  }
end
