class AddCropToSector < ActiveRecord::Migration[5.0]
  def change
    add_reference :sectors, :crop, foreign_key: true
  end
end
