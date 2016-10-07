class ChangeDataDefaultForStateStudy < ActiveRecord::Migration[5.0]
  def up
    change_column :studies, :state, :string, default: 'en_analisis'
  end
end
