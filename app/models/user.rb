class User < ApplicationRecord
    has_secure_password

    has_many :recipes

    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :name, length: {in: 4..20}
    validates :email, uniqueness: true

    
end
