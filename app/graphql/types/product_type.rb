Types::ProductType = GraphQL::ObjectType.define do
  name 'Product'
  description 'A product'

  field :id, types.Int
  field :name, types.String
  field :description, types.String

  field :ingredients do
    type types[Types::IngredientType]
    resolve -> (obj, args, ctx) {
      obj.product_ingredients
    }
  end
end
