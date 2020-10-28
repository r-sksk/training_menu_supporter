class RenameRecipeIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :recipe_id, :menu_id
  end
end
