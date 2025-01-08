class Comment < ApplicationRecord
  belongs_to :publication
  has_one :user, dependent: :destroy
end
