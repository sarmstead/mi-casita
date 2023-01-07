class CreateWindows < ActiveRecord::Migration[7.0]
  def change
    create_table :windows do |t|
      t.references :house, foreign_key: true
      t.timestamps
    end
  end
end
