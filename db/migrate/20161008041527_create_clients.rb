class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :commercial_business
      t.string :enterprise
      t.string :telephone
      t.string :cellphone
      t.string :email

      t.timestamps
    end
  end
end
