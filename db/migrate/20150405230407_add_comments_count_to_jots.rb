class AddCommentsCountToJots < ActiveRecord::Migration
  def change
    add_column :jots, :comments_count, :integer, default: 0
  end
end
