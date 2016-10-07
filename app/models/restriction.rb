class Restriction < ApplicationRecord
  belongs_to :sector

  validates :minimum_value, :maximum_value, presence: true
end
