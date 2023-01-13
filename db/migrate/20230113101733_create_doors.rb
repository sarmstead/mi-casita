class CreateDoors < ActiveRecord::Migration[7.0]
  def change
    create_table :doors, id: :uuid do |t|
      t.references :house, foreign_key: true, type: :uuid, null: false

      t.timestamps
    end
  end
end
