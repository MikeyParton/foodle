Types::ProductType = GraphQL::ObjectType.define do
  name 'Product'
  description 'A product'

  field :id, types.Int
  field :name, types.String
  field :barcode, types.String
  field :serving, types.String
  field :ingredients, types[Types::IngredientType]
  field :brands, types[Types::IngredientType]
  field :nutrients do

    argument :serving, types.String
    type Types::NutrientsType
    resolve -> (obj, args, ctx) {
      NutrientsView.new(obj.nutrients, args[:serving])
    }
  end
end
