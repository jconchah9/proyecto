class Plant < ApplicationRecord
  has_many :sectors
  belongs_to :company
  
  validates :name, presence: true
end
