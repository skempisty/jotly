class CreateJots < ActiveRecord::Migration
  def change
    create_table :jots do |t|
      t.string :title
      t.string :content
      t.integer :user_id, index: true
      t.decimal :lat, precision: 10, scale: 7
      t.decimal :long, precision: 11, scale: 8

      t.timestamps null: false
    end
  end
end
