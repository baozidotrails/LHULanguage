class CreateDemandLanguages < ActiveRecord::Migration
  def change
    create_table :demand_languages do |t|
      t.belongs_to :demand, index: true
      t.belongs_to :language, index: true

      t.timestamps
    end
  end
end
