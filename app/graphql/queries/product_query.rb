Queries::ProductQuery = GraphQL::ObjectType.define do
  field :product do
    argument :id, types.ID
    type Types::ProductType
    description "A product"
    resolve -> (obj, args, ctx) {
      Product.find_by_id(args[:id])
    }
  end
end
