class CreateHomeOwnerships < ActiveRecord::Migration[7.0]
  def change
    create_table :home_ownerships do |t|
      t.belongs_to :person
      t.belongs_to :house

      t.timestamps
    end
  end
end
