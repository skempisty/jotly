class CreateJots < ActiveRecord::Migration
  def change
    create_table :jots do |t|
      t.string :content
      t.string :user_id

      t.timestamps null: false
    end
  end
end
