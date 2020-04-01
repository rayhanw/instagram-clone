class RemoveDescriptionFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :description, :string
  end
end
