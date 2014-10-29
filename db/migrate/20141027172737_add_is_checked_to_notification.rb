class AddIsCheckedToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :is_checked, :boolean, default: false
  end
end
