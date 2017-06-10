class AddNicknameAndCodeToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :nickname, :string
    add_column :students, :student_code, :string
  end
end
