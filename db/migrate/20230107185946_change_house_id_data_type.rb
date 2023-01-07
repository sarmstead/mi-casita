class ChangeHouseIdDataType < ActiveRecord::Migration[7.0]
  def up
    add_column :houses, :uuid, :uuid, default: 'gen_random_uuid()', null: false
    rename_column :houses, :id, :bigint_id
    rename_column :houses, :uuid, :id
    execute 'ALTER TABLE houses drop constraint houses_pkey cascade;'
    execute 'ALTER TABLE houses ADD PRIMARY KEY (id);'
    execute 'ALTER TABLE ONLY houses ALTER COLUMN bigint_id DROP DEFAULT;'
    remove_column :houses, :bigint_id
    execute 'DROP SEQUENCE IF EXISTS houses_id_seq;'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
