class User < ApplicationRecord
    has_secure_password

    validates :name, :email, presence: true
    
    has_many :questions
end
