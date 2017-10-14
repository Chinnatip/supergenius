class AddPeriodsToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses , :period , :integer
  end
end
