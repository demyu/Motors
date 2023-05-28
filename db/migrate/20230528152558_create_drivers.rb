class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :name, :null => false
      t.string :address
      t.string :image
      t.string :phone
      t.references :motor, foreign_key: true, null: false
      t.timestamps
    end
  end
end
