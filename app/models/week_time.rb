class WeekTime < ActiveRecord::Base

  scope :spec_moment, -> (moment){ where("name LIKE ?", "%#{moment}%") }

  has_many :demand_times
  has_many :schedules, through: :demand_times, source: :demand, dependent: :destroy
end
