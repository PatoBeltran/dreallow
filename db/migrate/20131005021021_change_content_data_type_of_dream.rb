class ChangeContentDataTypeOfDream < ActiveRecord::Migration
  def change
    change_column :dreams, :content, :text
  end
end
