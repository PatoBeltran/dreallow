class CreateMeanings < ActiveRecord::Migration
  def change
    create_table :meanings do |t|
      t.text :content
      t.integer :user_id
      t.integer :dream_id

      t.timestamps
    end
  end
end
