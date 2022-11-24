class Rocket < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :photo

  validates :description, presence: true
  validates :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
                  against: %i[name address],
                  using: {
                  tsearch: { prefix: true } #ça signifie que la recherche comprend les débuts de mot
                  }
end
