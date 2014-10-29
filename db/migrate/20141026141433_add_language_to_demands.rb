class AddLanguageToDemands < ActiveRecord::Migration
  def change
    add_reference :demands, :language, index: true
  end
end
