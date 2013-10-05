class ChangeAnnonymousNameInDreams < ActiveRecord::Migration
  def change
    rename_column :dreams, :annonymous, :shared
  end
end
