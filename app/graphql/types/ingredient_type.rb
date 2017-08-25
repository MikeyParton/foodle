Types::IngredientType = GraphQL::ObjectType.define do
  name 'Ingredient'
  description 'An ingredient'

  field :id, types.Int
  field :name, types.String
  field :description, types.String
  field :quantity, types.Float
  field :units, types.String
end
