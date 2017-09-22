require 'rails_helper'

RSpec.describe Identity, type: :model do
  let(:credentials) { { uid: 'xyzlmnop', provider: 'facebook' } }

  describe '#for' do
    context 'when there is no identity for the credentials' do
      let(:identity) { Identity.for(credentials) }
      it { expect(identity.uid).to eq credentials[:uid] }
      it { expect(identity.provider).to eq credentials[:provider] }
      it { expect(identity.new_record?).to be true }
    end

    context 'when an identity already exists for the credentials' do
      let(:identity) { create(:identity) }
      let(:new_identity) { Identity.for(uid: identity.uid, provider: identity.provider) }
      it 'returns the existing identity' do
        expect(identity.id).to eq new_identity.id
      end
    end
  end
end
