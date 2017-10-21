class AddStatusToRegister < ActiveRecord::Migration[5.0]
  def change
    add_column :registers , :status, :string
  end
end
