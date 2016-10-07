class Sector < ApplicationRecord
  has_many :monitorings
  belongs_to :plant
  has_one :detail_contract
  has_many :restrictions

  validates :name, presence: true

  accepts_nested_attributes_for :plant
end
