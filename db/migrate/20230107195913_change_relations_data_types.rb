class ChangeRelationsDataTypes < ActiveRecord::Migration[7.0]
  def up
    add_column :home_ownerships, :uuid_house_id, :uuid, null: false
    rename_column :home_ownerships, :house_id, :bigint_house_id
    rename_column :home_ownerships, :uuid_house_id, :house_id
    remove_column :home_ownerships, :bigint_house_id

    add_column :home_ownerships, :uuid_person_id, :uuid, null: false
    rename_column :home_ownerships, :person_id, :bigint_person_id
    rename_column :home_ownerships, :uuid_person_id, :person_id
    remove_column :home_ownerships, :bigint_person_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
