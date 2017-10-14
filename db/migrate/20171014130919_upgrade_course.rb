class UpgradeCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses , :session_id , :string
    add_column :courses , :start      , :datetime
    add_column :courses , :end        , :datetime
    add_column :courses , :start_time , :time
    add_column :courses , :end_time   , :time
  end
end
