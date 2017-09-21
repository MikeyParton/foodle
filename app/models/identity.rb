class Identity < ApplicationRecord
  def self.for(auth)
    find_or_initialize_by(
      name: auth[:provider],
      uid: auth[:uid]
    )
  end
end
