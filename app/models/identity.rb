class Identity < ApplicationRecord
  belongs_to :user

  def self.for(auth)
    auth_attributes = {
      provider: auth.fetch(:provider),
      uid: auth.fetch(:uid, '')
    }
    find_or_initialize_by(auth_attributes).tap do |i|
      i.info = auth.fetch(:info)
    end
  end
end
