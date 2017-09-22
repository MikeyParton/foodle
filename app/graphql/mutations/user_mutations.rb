module UserMutations

  Register = GraphQL::Relay::Mutation.define do
    name 'RegisterUser'

    input_field :name, !types.String
    input_field :email, !types.String
    return_field :user, Types::UserType
    return_field :errors, types[types.String]

    resolve lambda(_, args, _) {
      user = User.new(args.to_h)
      return { user: user } if user.save
      { errors: user.errors.to_a }
    }
  end
end
