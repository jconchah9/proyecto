class CreateMonitorings < ActiveRecord::Migration[5.0]
  def change
    create_table :monitorings do |t|
      t.references :sector, foreign_key: true
      t.references :sensor, foreign_key: true

      t.timestamps
    end
  end
end
