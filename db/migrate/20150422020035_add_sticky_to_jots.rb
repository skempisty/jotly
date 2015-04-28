class AddStickyToJots < ActiveRecord::Migration
  def change
    add_column :jots, :sticky, :boolean, :default => false
  end
end
