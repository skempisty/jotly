class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :publisher_id
      t.string :subscriber_id

      t.timestamps null: false
    end
  end
end
