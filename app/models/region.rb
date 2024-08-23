class Region < ApplicationRecord
  has_many :breweries
  validates :sakenowaId, presence: true, uniqueness: true
end
