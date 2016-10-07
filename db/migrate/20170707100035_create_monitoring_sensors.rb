class CreateMonitoringSensors < ActiveRecord::Migration[5.0]
  def change
    create_table :monitoring_sensors do |t|
      t.float :measuring
      t.references :sensor, foreign_key: true
      t.timestamp :sent_at

      t.timestamps
    end
  end
end
