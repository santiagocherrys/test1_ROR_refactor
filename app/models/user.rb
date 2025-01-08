class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  #confirmable is for send email confirmation when you do sign up
  
  #Enum for role
  enum role: {admin: 0, writer: 1}

  #Validations
  validates :name, presence: true, length: {maximum: 70}
  validates :role, inclusion: {in: roles.keys} #this is for admit just the two roles
end
