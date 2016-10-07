class AddReferencePetitionToStudy < ActiveRecord::Migration[5.0]
  def change
    add_reference :studies, :petition, foreign_key: true
  end
end
