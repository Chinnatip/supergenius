class UpdateScoring2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :exams, :type

    add_column :exams, :exam_type , :string
    change_column :exams, :score , :string
  end
end
