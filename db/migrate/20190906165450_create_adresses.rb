class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
