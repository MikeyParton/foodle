Queries::IngredientQuery = GraphQL::ObjectType.define do
  field :ingredient do
    argument :id, !types.ID
    type Types::IngredientType
    description "An ingredient"
    resolve ->(_obj, args, _ctx) {
      Ingredient.find_by_id(args[:id])
    }
  end

  field :ingredients do
    argument :query, types.String
    type types[Types::IngredientType]
    description "Some ingredients"
    resolve ->(_obj, _args, _ctx) {
      Ingredient.all
    }
  end
end
