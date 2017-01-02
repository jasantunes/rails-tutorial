class User < ApplicationRecord
  validates :name, presence: true  # or validates(:name, presence: true)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } # simple: uniqueness: true
     
  # Ensure uniqueness by downcasting the email attribute
  before_save do
    self.email = email.downcase
  end
      
end
