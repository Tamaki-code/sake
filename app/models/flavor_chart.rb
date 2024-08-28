class FlavorChart < ApplicationRecord
  belongs_to :sake, foreign_key: :sakenowaBrandId, primary_key: :sakenowaId
end
