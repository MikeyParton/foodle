MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  field :registerUser, field: UserMutations::Register.field
end
