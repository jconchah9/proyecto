class AddColumnFeasibilityInStudies < ActiveRecord::Migration[5.0]
  def change
    add_attachment :studies, :feasibility
  end
end
