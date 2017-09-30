Mutations::UserMutations = GraphQL::ObjectType.define do
  field :facebook_login do
    name 'facebook_login'
    type Types::UserType
    argument :token, !types.String

    resolve ->(_obj, args, ctx) {
      ctx[:show_token] = true
      return SocialLogin::Facebook.new(args[:token]).process
    }
  end
end
