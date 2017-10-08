class UpdateMapAndWordtagInCms < ActiveRecord::Migration[5.0]
  def change
    add_column :cms , :map , :string
    add_column :cms , :word_pool , :text
  end
end
