class CreateCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
      t.datetime :visit_date
      t.string :state
      t.text :sumary
      t.references :study, foreign_key: true, index: true

      t.timestamps
    end
  end
end
