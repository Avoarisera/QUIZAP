class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }, if: :password
  validates :email, presence: true
  validates_format_of :email, with: /.+@.+\..+/i
  validates :email, uniqueness: { case_sensitive: false }

end
