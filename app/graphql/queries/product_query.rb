Queries::ProductQuery = GraphQL::ObjectType.define do
  field :product do
    argument :id, types.ID
    argument :barcode, types.String
    type Types::ProductType
    description "A product"
    resolve -> (obj, args, ctx) {
      query = {
        id: args[:id],
        barcode: args[:barcode]
      }.compact
      Product.find_by(query)
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
