class Category < ApplicationRecord
  has_one :publication, dependent: :destroy
end
