class CreateDoors < ActiveRecord::Migration[7.0]
  def change
    create_table :doors, id: :uuid do |t|

      t.timestamps
    end
  end
end
