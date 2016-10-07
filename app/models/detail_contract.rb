class DetailContract < ApplicationRecord
  belongs_to :contract
  belongs_to :sector

  accepts_nested_attributes_for :sector

  after_save :assignment_for_sensors

  def assignment_for_sensors
    (1..12).each do |n|
      sensor = Sensor.create(id_sensor:n, type_sensor: "humedad")
      Monitoring.create(sensor_id: sensor.id, sector_id: sector_id)
    end
  end
end
