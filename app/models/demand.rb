class Demand < ActiveRecord::Base

  default_scope { order(created_at: :desc) }

  validates :description, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :language

  has_many :demand_users
  has_many :applicants, through: :demand_users, source: :user

  has_many :demand_times
  has_many :arrangements, through: :demand_times, source: :week_time

  has_many :notifications
end
