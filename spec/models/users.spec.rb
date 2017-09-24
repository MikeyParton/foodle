require 'rails_helper'

RSpec.describe User do
  it 'doesn\'t let 2 users share the same email' do
    create(:user, email: 'thisoldemail@aol.com')
    user = build(:user, email: 'thisoldemail@aol.com')
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end
end
