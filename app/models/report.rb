class Report < ApplicationRecord
  belongs_to :sensor

  def self.daily(sector_id)
    data = []
    Monitoring.where(sector_id: sector_id).order(:sensor_id).pluck(:sensor_id).each do |m|
      s = Sensor.find(m).id_sensor
      x = Report.where(sensor_id: m, sent_at: Date.today.at_beginning_of_week..Date.today).pluck(:sent_at, :average_value)
      day = Hash[name: "Sensor #{s}", data: x]
      data << day
    end
    data
  end
end
