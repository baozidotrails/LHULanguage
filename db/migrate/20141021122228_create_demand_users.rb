class CreateDemandUsers < ActiveRecord::Migration
  def change
    create_table :demand_users do |t|
      t.belongs_to :demand, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
