class CreateWeekTimes < ActiveRecord::Migration
  def change
    create_table :week_times do |t|
      t.string :name

      t.timestamps
    end
  end
end
