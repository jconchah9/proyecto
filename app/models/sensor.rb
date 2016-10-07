class Sensor < ApplicationRecord
  has_one :monitoring

  def self.available
    where.not(id: Sensor.joins(:monitoring).pluck(:id))
  end
end
