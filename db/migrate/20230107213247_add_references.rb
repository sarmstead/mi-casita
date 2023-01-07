class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_index :home_ownerships, :house_id
    add_index :home_ownerships, :person_id
    add_index :windows, :house_id
  end
end
