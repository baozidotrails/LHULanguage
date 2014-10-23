class DemandLanguage < ActiveRecord::Base
  belongs_to :demand
  belongs_to :language
end
