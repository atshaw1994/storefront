class RemoveUserIdFromCarts < ActiveRecord::Migration[7.1]
  def change
    remove_column :carts, :user_id, :integer
  end
end
