class AddOdmIdToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses , :odm_member_id, :integer
  end
end
