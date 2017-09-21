module UserMutations

  Register = GraphQL::Relay::Mutation.define do
    name 'RegisterUser'

    input_field :name, !types.String
    input_field :email, !types.String
    return_field :user, Types::UserType
    return_field :errors, types[types.String]

    resolve -> (obj, args, ctx) {
      user = User.new(args.to_h)
      if user.save
        return { user: user }
      else
        return { errors: user.errors.to_a }
      end
    }
  end
end
