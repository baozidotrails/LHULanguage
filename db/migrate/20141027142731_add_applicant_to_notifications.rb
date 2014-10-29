class AddApplicantToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :applicant_id, :integer
  end
end
