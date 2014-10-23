class Demand < ActiveRecord::Base

  validates :description, presence: true

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  has_many :demand_users
  has_many :applicants, through: :demand_users, source: :user

  has_many :demand_times
  has_many :arrangements, through: :demand_times, source: :week_time

  has_many :demand_languages
  has_many :specifications, through: :demand_languages, source: :language
end
