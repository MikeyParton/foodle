Queries::BrandQuery = GraphQL::ObjectType.define do
  field :brand do
    argument :id, !types.ID
    type Types::BrandType
    description "A brand"
    resolve ->(_obj, args, _ctx) {
      Brand.find_by_id(args[:id])
    }
  end
end
