class AddViewerToNew < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :viewer, :integer
  end
end
