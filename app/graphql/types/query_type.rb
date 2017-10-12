Types::QueryType = GraphQL::ObjectType.new.tap do |root_type|
  root_type.name = 'Query'
  root_type.description = 'The root query of this Schema'
  root_type.interfaces = []
  root_type.fields = Util::FieldCombiner.combine([
    Queries::ProductQuery,
    Queries::IngredientQuery,
    Queries::BrandQuery
  ])
end
