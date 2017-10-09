Types::NutrientType = GraphQL::ObjectType.define do
  name 'Nutrient'
  description 'A nutrient'

  field :id, types.Int
  field :name, types.String
  field :value, types.String
  field :unit, types.String
end
