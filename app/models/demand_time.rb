class DemandTime < ActiveRecord::Base
  belongs_to :demand
  belongs_to :week_time
end
