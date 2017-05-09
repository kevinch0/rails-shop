class RemoveAccountId < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :account_id
  end
end
