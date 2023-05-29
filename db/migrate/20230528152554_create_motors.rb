class CreateMotors < ActiveRecord::Migration[7.0]
  def change
    create_table :motors do |t|
      t.string :name, null: false
      t.string :plate_number
      t.timestamps
    end
  end
end
