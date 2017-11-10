class AddPasswordToTeacher < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers , :password , :string
  end
end
