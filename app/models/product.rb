class Product < ApplicationRecord
  belongs_to :brand
  has_many :product_ingredients
  has_many :ingredients, through: :product_ingredients

  include PgSearch

  pg_search_scope :query,
    against: [:name],
    associated_against: {
      ingredients: [:name]
    },
    using: {
      tsearch: { prefix: true, any_word: true }
    }
end
