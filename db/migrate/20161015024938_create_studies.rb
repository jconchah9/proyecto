class CreateStudies < ActiveRecord::Migration[5.0]
  def change
    create_table :studies do |t|
      t.text :feasibility, default: 'null'
      t.string :summary, default: 'null'
      t.string :state, default: 'pendiente'
      t.timestamps
    end
  end
end
