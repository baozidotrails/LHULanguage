class Notification < ActiveRecord::Base

  default_scope { order(created_at: :desc) }
  scope :uncheck, -> { where(is_checked: false) }

  belongs_to :user
  belongs_to :applicant, class_name: 'User'
  belongs_to :demand

  def self.send_notification_with(applicant, demand)
    create user: demand.author, demand: demand, applicant: applicant
  end
end
