class Demand < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  has_many :demand_users
  has_many :applicants, through: :demand_users, source: :user
end
