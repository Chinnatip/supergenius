class AddOdMmemberIdToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students , :odm_member_id, :integer
  end
end
