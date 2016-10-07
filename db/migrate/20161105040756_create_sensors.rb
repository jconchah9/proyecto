class CreateSensors < ActiveRecord::Migration[5.0]
  def change
    create_table :sensors do |t|
      t.integer :id_sensor
      t.string :type_sensor

      t.timestamps
    end
  end
end
