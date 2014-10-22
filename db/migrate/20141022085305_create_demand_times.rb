class CreateDemandTimes < ActiveRecord::Migration
  def change
    create_table :demand_times do |t|
      t.belongs_to :demand, index: true
      t.belongs_to :week_time, index: true

      t.timestamps
    end
  end
end
