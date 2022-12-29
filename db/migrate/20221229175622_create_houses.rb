class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :exterior_color
      t.string :trim_color

      t.timestamps
    end
  end
end
