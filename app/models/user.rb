class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_many :articles
    validates :username, uniqueness: {case_sensitive: false },
                         length: {in: 6..15 },
                         presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,    uniqueness: {case_sensitive: false }, 
                         length: {in: 6..100 },
                         presence: true,
                         format: {with: VALID_EMAIL_REGEX }
    has_secure_password
end