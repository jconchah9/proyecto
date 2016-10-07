class CreatePhotoSectors < ActiveRecord::Migration[5.0]
  def change
    create_table :photo_sectors do |t|
      t.string :name
      t.string :type_file
      t.string :description
      t.attachment :document
      t.references :sector, foreign_key: true

      t.timestamps
    end
  end
end
