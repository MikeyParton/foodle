Queries::ProductQuery = GraphQL::ObjectType.define do
  field :product do
    argument :id, types.ID
    type Types::ProductType
    description "A product"
    resolve -> (obj, args, ctx) {
      Product.find_by_id(args[:id])
    }
  end

  field :products do
    argument :query, types.String
    type types[Types::ProductType]
    description "Some products"
    resolve -> (obj, args, ctx) {
      products = Product.all
      products = products.query(args[:query]) if args[:query].present?
      products
    }
  end
end
