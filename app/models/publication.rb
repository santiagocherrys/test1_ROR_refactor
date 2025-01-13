class Publication < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  belongs_to :user

  #validations
  validates :title, presence: true, length: {maximum: 70}
  validates :title, presence: true, length: {maximum: 500}
  #validates :category, presence: true
  #por qué la linea anterior me daña el código
  validates :status, presence: true

end
