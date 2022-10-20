class User < ApplicationRecord
    has_many :articles
    validates :username, uniqueness: {case_sensitive: false },
                         length: {in: 6..15 },
                         presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,    uniqueness: {case_sensitive: false }, 
                         length: {in: 6..100 },
                         presence: true,
                         format: {with: VALID_EMAIL_REGEX }
end