class AddSecretIdToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :secret_id, :string
  end
end
