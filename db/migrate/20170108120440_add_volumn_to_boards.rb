class AddVolumnToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :volumn, :decimal
  end
end
