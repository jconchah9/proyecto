class AddAcceptanceToContract < ActiveRecord::Migration[5.0]
  def change
    add_reference :contracts, :acceptance, foreign_key: true
  end
end
