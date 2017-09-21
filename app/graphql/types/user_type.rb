Types::UserType = GraphQL::ObjectType.define do
  name 'User'
  description 'A User'

  field :id, types.Int
  field :name, types.String
  field :email, types.String

  field :errors, types[types.String] do
    resolve -> (obj, args, ctx) { obj.errors.full_messages }
  end
end
