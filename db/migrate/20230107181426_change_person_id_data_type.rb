class ChangePersonIdDataType < ActiveRecord::Migration[7.0]
  def up
    add_column :people, :uuid, :uuid, default: 'gen_random_uuid()', null: false
    rename_column :people, :id, :bigint_id
    rename_column :people, :uuid, :id
    execute 'ALTER TABLE people drop constraint people_pkey;'
    execute 'ALTER TABLE people ADD PRIMARY KEY (id);'
    execute 'ALTER TABLE ONLY people ALTER COLUMN bigint_id DROP DEFAULT;'
    remove_column :people, :bigint_id
    execute 'DROP SEQUENCE IF EXISTS people_id_seq;'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
