class DropAdress < ActiveRecord::Migration[6.0]
  def change
    drop_table :adresses
  end
end
