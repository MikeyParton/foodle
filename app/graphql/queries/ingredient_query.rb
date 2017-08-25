Queries::IngredientQuery = GraphQL::ObjectType.define do
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
end
