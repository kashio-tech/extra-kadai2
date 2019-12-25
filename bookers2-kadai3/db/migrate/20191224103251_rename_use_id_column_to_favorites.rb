class RenameUseIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
  	rename_column :favorites, :use_id, :user_id
  end
end
