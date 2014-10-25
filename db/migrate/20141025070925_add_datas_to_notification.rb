class AddDatasToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :datas, :text
  end
end
