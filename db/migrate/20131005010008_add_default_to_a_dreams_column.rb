class AddDefaultToADreamsColumn < ActiveRecord::Migration
  def change
    change_column :dreams, :shared, :boolean, default: true
  end
end
