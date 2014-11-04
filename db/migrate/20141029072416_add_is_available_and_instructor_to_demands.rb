class AddIsAvailableAndInstructorToDemands < ActiveRecord::Migration
  def change
    add_column :demands, :is_available, :boolean, default: true
    add_column :demands, :instructor_id, :integer
  end
end
