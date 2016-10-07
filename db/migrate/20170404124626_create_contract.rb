class CreateContract < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.belongs_to :company, foreign_key: true
      t.timestamp :start_date
      t.timestamp :end_date
      t.belongs_to :user, foreign_key: true
    end
  end
end
