class Brewery < ApplicationRecord
  belongs_to :region
  has_many :sakes
  validates :sakenowa_brewery_id, presence: true, uniqueness: true
end
