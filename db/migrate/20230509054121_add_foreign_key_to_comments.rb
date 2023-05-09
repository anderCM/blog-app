class AddForeignKeyToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :post_id, :integer
    add_foreign_key :comments, :posts
  end
end
