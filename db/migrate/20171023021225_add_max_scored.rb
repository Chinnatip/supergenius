class AddMaxScored < ActiveRecord::Migration[5.0]
  def change
    add_column :classrooms , :max_score, :string
  end
end
