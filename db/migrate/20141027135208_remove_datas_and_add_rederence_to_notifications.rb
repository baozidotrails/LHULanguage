class RemoveDatasAndAddRederenceToNotifications < ActiveRecord::Migration
  def change
    remove_column :notifications, :datas
    add_column :notifications, :demand_id, :integer
  end
end
