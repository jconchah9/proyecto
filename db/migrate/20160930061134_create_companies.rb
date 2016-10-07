class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :commercial_business
      t.string :rut
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
