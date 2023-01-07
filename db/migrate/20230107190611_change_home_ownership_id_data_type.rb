class ChangeHomeOwnershipIdDataType < ActiveRecord::Migration[7.0]
  def up
    add_column :home_ownerships, :uuid, :uuid, default: 'gen_random_uuid()', null: false
    rename_column :home_ownerships, :id, :bigint_id
    rename_column :home_ownerships, :uuid, :id
    execute 'ALTER TABLE home_ownerships drop constraint home_ownerships_pkey;'
    execute 'ALTER TABLE home_ownerships ADD PRIMARY KEY (id);'
    execute 'ALTER TABLE ONLY home_ownerships ALTER COLUMN bigint_id DROP DEFAULT;'
    remove_column :home_ownerships, :bigint_id
    execute 'DROP SEQUENCE IF EXISTS home_ownerships_id_seq;'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
