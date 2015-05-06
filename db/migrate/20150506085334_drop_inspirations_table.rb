class DropInspirationsTable < ActiveRecord::Migration
    def change
        drop_table :inspirations
    end
end
