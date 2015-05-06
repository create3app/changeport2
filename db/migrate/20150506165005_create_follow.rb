class CreateFollow < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :followee_id
      t.integer :follower_id
    end
  end
end
