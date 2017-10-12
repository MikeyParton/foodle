Types::BrandType = GraphQL::ObjectType.define do
  name 'Brand'
  description 'A Brand'

  field :id, types.Int
  field :name, types.String
  field :products, types[Types::ProductType]
end
