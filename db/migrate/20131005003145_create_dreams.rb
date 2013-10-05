class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :content
      t.integer :user_id
      t.boolean :annonymous

      t.timestamps
    end
  end
end
