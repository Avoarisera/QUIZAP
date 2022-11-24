class User < ApplicationRecord
  include Roleable
  has_secure_password
  has_many :quizzs
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /.+@.+\..+/i }
  validates :password, presence: true, length: { minimum: 6 }, if: :password
  # NOTE: Forces lower case for email attribute
  def email=(value)
    super(value&.downcase)
  end
end
