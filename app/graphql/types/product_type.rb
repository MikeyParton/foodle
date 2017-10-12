Types::ProductType = GraphQL::ObjectType.define do
  name 'Product'
  description 'A product'

  field :id, types.Int
  field :name, types.String
  field :barcode, types.String
  field :serving, types.String
  field :energy, types.String
  field :proteins, types.String
  field :carbohydrates, types.String
  field :sugars, types.String
  field :sodium, types.String
  field :fat, types.String
  field :fiber, types.String
  field :ingredients, types[Types::IngredientType]
  field :brands, types[Types::IngredientType]
end
