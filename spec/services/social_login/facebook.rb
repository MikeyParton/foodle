require 'rails_helper'
require 'vcr_helper'

RSpec.describe SocialLogin::Facebook do
  describe 'getting a user from a token', :vcr do
    context 'given a valid token' do
      let(:token) { 'EAACEdEose0cBAHpiThNSAZAQvcUZBzwnSZBzxmRbT57EzCtlmFqPBa2JHe6lJzfHHXQAI2K9Sbt9WaVoiLFZARun7np0TFV5a6fsD66ZBjtUTSeFZBOsZBtV2gBZAG0Kg74XCWbqEEsYv5OlZA73a5L46P7T8TRphacoHIBllZA9XNl23QCJpfKtKuMSQphNaSZCsUGZAtY7kOq79gZDZD' }
      let(:user) { SocialLogin::Facebook.new(token).process }

      context 'logging in for the first time' do
        it 'returns a new user' do
          expect(user).to be_a(User)
        end

        it 'sets the user\'s attributes' do
          expect(user.first_name).to eq('Michael')
          expect(user.last_name).to eq('Parton')
          expect(user.email).to eq('mikeparton@live.com.au')
        end

        it 'creates an identity for the user' do
          expect(user.identities.length).to eq(1)
        end
      end

      context 'existing user returning to the app' do
        let(:returning_user) { SocialLogin::Facebook.new(token).process }

        it 'returns the existing user' do
          expect(returning_user).to eq(user)
        end

        it 'doesn\'t create another identity' do
          expect(returning_user.identities.length).to eq(1)
        end
      end
    end

    context 'given a invalid token' do
      let(:token) { 'invalid_token' }
      let(:user) { SocialLogin::Facebook.new(token).process }

      it 'returns nil' do
        expect(user).to be(nil)
      end
    end
  end
end
