class ChangeStockInBoard < ActiveRecord::Migration[5.0]
  def up
    change_column :boards , :stock, :decimal
  end

  def down
    change_column :boards , :stock, :integer
  end
end
