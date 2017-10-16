Types::NutrientsType = GraphQL::ObjectType.define do
  name 'Nutrients'
  description 'Some nutrients'

  field :id, types.Int
  field :product, Types::ProductType

  field :energy_value, types.String
  field :energy_unit, types.String
  field :proteins_value, types.String
  field :proteins_unit, types.String
  field :carbohydrates_value, types.String
  field :carbohydrates_unit, types.String
  field :sugars_value, types.String
  field :sugars_unit, types.String
  field :fat_value, types.String
  field :fat_unit, types.String
  field :fiber_value, types.String
  field :fiber_unit, types.String
  field :sodium_value, types.String
  field :sodium_unit, types.String
end
