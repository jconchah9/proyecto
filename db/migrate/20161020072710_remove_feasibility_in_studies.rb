class RemoveFeasibilityInStudies < ActiveRecord::Migration[5.0]
  def change
    remove_column :studies, :feasibility
  end
end
