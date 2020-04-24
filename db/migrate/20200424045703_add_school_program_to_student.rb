class AddSchoolProgramToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students , :school_program, :string
  end
end
