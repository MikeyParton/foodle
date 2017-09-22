module SocialLogin
  class Base
    def initialize(token)
      @token = token
    end

    def process
      identity = Identity.for(auth_hash)
      raise 'Could not initialize Identity' unless identity.present?
      find_or_create_user(identity)
    end

    private

    def find_or_create_user(identity)
      email = identity.info.fetch('email')
      user = User.find_by(email: email) if email.present?
      user.create(attributes_for_identity(identity)) if user.blank?
      user.identities << identity
      user
    end

    def attributes_for_identity(identity)
      {
        first_name: identity.info.fetch("first_name"),
        last_name: identity.info.fetch("last_name"),
        email: identity.info.fetch("email")
      }
    end
  end
end
