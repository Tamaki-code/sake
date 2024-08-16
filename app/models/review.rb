class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sake
  has_one_attached :image
end
