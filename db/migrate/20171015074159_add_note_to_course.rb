class AddNoteToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses , :note, :text
  end
end
