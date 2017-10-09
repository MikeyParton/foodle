Types::ProductType = GraphQL::ObjectType.define do
  name 'Product'
  description 'A product'

  field :id, types.Int
  field :name, types.String
  field :barcode, types.String
  field :ingredients, types[Types::IngredientType]
  field :nutrients, types[Types::NutrientType]
end
