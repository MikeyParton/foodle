module SocialLogin
  class Base
    def initialize(token)
      @token = token
    end

    def process
      ActiveRecord::Base.transaction do
        identity = Identity.for(auth_hash)
        user = find_or_create_user(identity)
        user.regenerate_token
        # Link user with identity if it is new
        user.identities << identity unless user.identities.include?(identity)
        user
      end
    rescue => e
      nil
    end

    private

    def find_or_create_user(identity)
      return identity.user if identity.user.present?
      email = identity.info.fetch('email')
      # try to find an existing user with email from identity
      user = User.find_by(email: email) if email.present?
      # create a new user
      user = User.create(attributes_for_identity(identity)) if user.blank?
      user
    end

    def attributes_for_identity(identity)
      {
        first_name: identity.info.fetch('first_name'),
        last_name: identity.info.fetch('last_name'),
        email: identity.info.fetch('email')
      }
    end
  end
end
