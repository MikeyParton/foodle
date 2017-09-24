Types::UserType = GraphQL::ObjectType.define do
  name 'User'
  description 'A User'
  field :id, types.Int
  field :first_name, types.String
  field :last_name, types.String
  field :email, types.String
  field :token, types.String do
    resolve ->(_obj, _args, ctx) { ctx[:show_token] ? 'token' : nil }
  end
end
