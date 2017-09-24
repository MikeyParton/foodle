class User < ApplicationRecord
  has_many :identities
  has_secure_token :token
  validates_uniqueness_of :email
end
