class Publication < ApplicationRecord
  has_one :category, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  #validations
  validates :title, presence: true, length: {maximum: 70}
  validates :title, presence: true, length: {maximum: 500}
  validates :category, presence: true
  validates :status, presence: true
end
