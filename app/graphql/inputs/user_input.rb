Inputs::UserInput = GraphQL::InputObjectType.define do
  name 'CreateUserInput'
  argument :name, types.String
  argument :email, !types.String
end
