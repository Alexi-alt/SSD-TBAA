class User < ApplicationRecord
    
    has_secure_password
    
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true, presence: true, allow_blank: false
    validates :name, :password_digest, presence: true
    
end
