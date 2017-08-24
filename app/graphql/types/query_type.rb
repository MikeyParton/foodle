Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :ingredient do
    type Types::IngredientType
    description "An ingredient"
    resolve -> (obj, args, ctx) {
      Ingredient.first
    }
  end
end
