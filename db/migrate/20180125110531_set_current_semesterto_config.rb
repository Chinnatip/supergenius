class SetCurrentSemestertoConfig < ActiveRecord::Migration[5.0]
  def change
    add_column :configs , :current_semester, :integer
  end
end
