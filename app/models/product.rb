class Product < ApplicationRecord
  has_many :product_brands, dependent: :destroy
  has_many :brands, through: :product_brands
  has_many :product_ingredients, dependent: :destroy
  has_many :ingredients, through: :product_ingredients
  has_one  :nutrients

  enum source: %w[foodle open_food]

  include PgSearch

  pg_search_scope :query,
                  against: [:name],
                  associated_against: {
                    ingredients: [:name]
                  },
                  using: {
                    tsearch: { prefix: true, any_word: true }
                  }

  validates_presence_of :name
  validates_uniqueness_of :barcode
end
