class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
