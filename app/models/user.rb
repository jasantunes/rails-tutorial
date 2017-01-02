class User < ApplicationRecord
  validates :name, presence: true  # or validates(:name, presence: true)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } # simple: uniqueness: true

  # has_secure_password:
  #  - Save a securely hashed password_digest attribute to the database
  #  - A pair of virtual attributes (password and password_confirmation), including
  #    presence validations upon object creation and a validation requiring that they match
  #  - An authenticate method that returns the user when the password is correct
  #    (and false otherwise)
  #  - has_secure_password requires an attribute called password_digest
  has_secure_password
     
  # Ensure uniqueness by downcasting the email attribute
  before_save do
    self.email = email.downcase
  end
      
end
