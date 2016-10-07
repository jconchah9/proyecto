class CreatePetition < ActiveRecord::Migration[5.0]
  def change
    create_table :petitions do |t|
      t.string :state, default: 'pendiente'
      t.references :client, foreign_key: true, index: true
      t.text :summary
      t.attachment :request
      t.timestamps
    end
  end
end
