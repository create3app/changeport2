class AddCompletedAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :completed_at, :datetime
  end
end
