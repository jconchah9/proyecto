class CreateReport < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.timestamp :sent_at
      t.float :average_value
      t.float :minimun_value
      t.float :maximum_value
      t.belongs_to :sensor, foreign_key: true
      t.string :type_value
    end
  end
end
