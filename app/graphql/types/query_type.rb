Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :ingredient do
    argument :id, types.ID
    type Types::IngredientType
    description "An ingredient"
    resolve -> (obj, args, ctx) {
      Ingredient.find_by_id(args[:id])
    }
  end

  field :ingredients do
    type types[Types::IngredientType]
    description "Some ingredients"
    resolve -> (obj, args, ctx) {
      Ingredient.all
    }
  end

  field :product do
    argument :id, types.ID
    type Types::ProductType
    description "A product"
    resolve -> (obj, args, ctx) {
      Product.find_by_id(args[:id])
    }
  end
end
