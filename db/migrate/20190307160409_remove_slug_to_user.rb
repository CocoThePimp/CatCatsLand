class RemoveSlugToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :slug, :string
  end
end
