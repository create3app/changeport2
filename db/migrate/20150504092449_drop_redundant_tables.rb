class DropRedundantTables < ActiveRecord::Migration
  def change
    drop_table :follows
    drop_table :friendships
    drop_table :followships
  end
end
