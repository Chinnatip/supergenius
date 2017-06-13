class UpdateScoring < ActiveRecord::Migration[5.0]
  def change
    remove_column :exams, :ref_class
    remove_column :exams, :issue

    add_column :exams, :classroom , :string
    add_column :exams, :period , :integer
    add_column :exams, :type , :string

    change_column :exams, :score , :float
    change_column :exams, :student , :string
  end
end
