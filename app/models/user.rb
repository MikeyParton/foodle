class User < ApplicationRecord
  has_many :identities
  validates_uniqueness_of :email
end
