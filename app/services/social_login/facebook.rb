module SocialLogin
  class Facebook < Base
    def provider_api
      @graph ||= Koala::Facebook::API.new(@token)
    end

    def facebook_user
      @facebook_user ||= provider_api.get_object('me?fields=id,first_name,last_name')
    end

    def avatar
      @avatar ||= provider_api.get_picture(facebook_user.fetch('id'), type: 'large')
    end

    def auth_hash
      {
        credentials: { token: @access_token.to_s },
        provider: 'facebook',
        uid: facebook_user.fetch('id'),
        info: {
          email: facebook_user.fetch("email", ""),
          first_name: facebook_user.fetch('first_name', ""),
          last_name: facebook_user.fetch("last_name", ""),
          avatar_url: avatar
        }
      }
    end
  end
end
