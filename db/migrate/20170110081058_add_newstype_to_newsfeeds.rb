class AddNewstypeToNewsfeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :newsfeeds, :newstype, :string
  end
end
