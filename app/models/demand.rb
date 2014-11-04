class Demand < ActiveRecord::Base

  default_scope { order(created_at: :desc) }
  scope :available, -> { where(instructor_id: nil) }

  validates :description, presence: true

  # todo: describe how did I figure this our through recoring casts
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :instructor, class_name: 'User'
  belongs_to :language

  has_many :demand_users
  has_many :applicants, through: :demand_users, source: :user

  has_many :demand_times
  has_many :arrangements, through: :demand_times, source: :week_time

  has_many :notifications
end
