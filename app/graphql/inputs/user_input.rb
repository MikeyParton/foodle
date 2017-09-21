Inputs::UserInput = GraphQL::InputObjectType.define do
  name 'CreateUserInput'
  argument :name, types.String
  argument :email, !types.String
  # argument :remote_avatar_url, types.String
  # argument :remote_cover_photo_url, types.String
  # argument :contact_number, types.String
  # argument :uid, types.String
  # argument :social_url, types.String
  # argument :provider, types.String
  # argument :password, !types.String
end
