class ChangeWindowIdDataType < ActiveRecord::Migration[7.0]
  def up
    add_column :windows, :uuid, :uuid, default: 'gen_random_uuid()', null: false
    rename_column :windows, :id, :bigint_id
    rename_column :windows, :uuid, :id
    execute 'ALTER TABLE windows drop constraint windows_pkey;'
    execute 'ALTER TABLE windows ADD PRIMARY KEY (id);'
    execute 'ALTER TABLE ONLY windows ALTER COLUMN bigint_id DROP DEFAULT;'
    remove_column :windows, :bigint_id
    execute 'DROP SEQUENCE IF EXISTS windows_id_seq;'

    add_column :windows, :uuid_house_id, :uuid, null: false
    rename_column :windows, :house_id, :bigint_house_id
    rename_column :windows, :uuid_house_id, :house_id
    execute 'ALTER TABLE ONLY windows ALTER COLUMN bigint_house_id DROP DEFAULT;'
    remove_column :windows, :bigint_house_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
