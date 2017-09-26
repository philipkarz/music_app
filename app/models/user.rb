class User < ApplicationRecord
    has_secure_password
    has_many :songs
    has_many :comments
    validates_confirmation_of :password
end
