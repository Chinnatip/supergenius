class AddSemesterToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses , :semester , :string
  end
end
