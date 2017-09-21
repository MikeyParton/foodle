Types::IngredientType = GraphQL::ObjectType.define do
  name 'Ingredient'
  description 'An ingredient'

  field :id, types.Int
  field :name, types.String
  field :description, types.String
end
