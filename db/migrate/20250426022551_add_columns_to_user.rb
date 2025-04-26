class AddColumnsToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :abc_subscription_status, :string
    add_column :users, :abc_subscription_synced_at, :datetime
  end
end
