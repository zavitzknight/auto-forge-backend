class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
    
  has_many :cars
  

  validates :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, :password_confirmation, length: { minimum: 6 }
  validates_confirmation_of :password
end

