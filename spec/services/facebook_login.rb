require 'rails_helper'
require 'vcr_helper'

RSpec.describe SocialLogin::Facebook do
  describe '#user', :vcr do
    context 'given a valid token' do
      let!(:user) { SocialLogin::Facebook.new('EAACEdEose0cBAI2SZCL3JWRLV3KXRZAGqSZAghjqHxzQqq7hKCNZCtSWPIuXrAERe0qVKwAIKILtJtUgS65CtFlp1SKgWsUl5WBZCyZBtzKPbovlaKzSgxNsOjAF6VtL2GU7q1bkc0SatkLt10oAZAfChWrRXyyRZAdLuJyP48FciIFPA7cUQztRnPyeIZBQdV5AhmkPBTASEbQZDZD').user }

      it 'should work' do
        expect(user).to eq true
      end
    end
  end
end
