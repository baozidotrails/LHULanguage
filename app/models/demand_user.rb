class DemandUser < ActiveRecord::Base
  belongs_to :demand
  belongs_to :user
end
