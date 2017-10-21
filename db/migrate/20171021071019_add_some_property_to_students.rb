class AddSomePropertyToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students , :gender, :string
    add_column :students , :tel_parent, :string
    add_column :students , :birthday, :string
    change_column :students , :tel, :string
  end
end
