class AddNewstypeToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :newstype, :string
  end
end
