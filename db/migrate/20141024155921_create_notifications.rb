class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :content
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
