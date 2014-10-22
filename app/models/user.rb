class User < ActiveRecord::Base

  has_many :demands, dependent: :destroy

  has_many :demand_users
  has_many :applied_demands, through: :demand_users, source: :demand

  has_secure_password
  before_save :format_email!

  def format_email!
    email.downcase!
  end

  def apply!(demand)
    applied_demands << demand
  end

  def cancel_apply!(demand)
    applied_demands.delete(demand)
  end

  def already_apply_for?(demand)
    applied_demands.include?(demand)
  end

  def is_mine?(demand)
    demands.include?(demand)
  end
end
