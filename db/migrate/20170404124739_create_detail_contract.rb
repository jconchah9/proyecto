class CreateDetailContract < ActiveRecord::Migration[5.0]
  def change
    create_table :detail_contracts do |t|
      t.belongs_to :contract, foreign_key: true
      t.belongs_to :sector, foreign_key: true
    end
  end
end
