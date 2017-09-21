# {
#   "id": "1252969724730376",
#   "name": "Michael Parton",
#   "picture": {
#     "data": {
#       "is_silhouette": false,
#       "url": "https://scontent.xx.fbcdn.net/v/t1.0-1/p50x50/14938268_1438531152840898_5919807328669120997_n.jpg?oh=067afe42855c8ba39196e059c0eda127&oe=5A3E6731"
#     }
#   }
# }
module SocialLogin
  class Facebook
    def initialize(token)
      @token = token
    end
  end

  def user
    @user = find_for_omniauth(omniauth_credentials)
  end

  private

  def provider_api
    @graph ||= Koala::Facebook::API.new(@token)
  end

  def facebook_user
    @facebook_user ||= provider_api.get_object("me?fields=id,first_name,last_name")
  end

  def avatar
    @avatar ||= provider_api.get_picture(facebook_user.fetch("id"), type: "large")
  end

  def find_for_omniauth(credentials)
    identity = SocialProvider.find_or_create_for(credentials)
    raise "Could not initialize Identity" unless identity.present?
    find_or_create_user(identity)
  end

  def find_or_create_user(identity)
  end

  def omniauth_credentials
    {
      credentials: { token: @access_token.to_s },
      provider: 'facebook',
      uid: facebook_user.fetch("id"),
      info: {
        email: facebook_user.fetch("email", ""),
        first_name: facebook_user.fetch("first_name", ""),
        last_name: facebook_user.fetch("last_name", ""),
        avatar_url: avatar
      }
    }
  end
end
