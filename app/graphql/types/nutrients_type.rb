Types::NutrientsType = GraphQL::ObjectType.define do
  name 'Nutrients'
  description 'Some nutrients'

  field :id, types.Int
  field :product, Types::ProductType

  field :energy_value, types.String
  field :proteins_value, types.String
  field :carbohydrates_value, types.String
  field :sugars_value, types.String
  field :fat_value, types.String
  field :fiber_value, types.String
  field :sodium_value, types.String
end
