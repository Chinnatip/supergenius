class RemoveAndAddoOdmKeyOnCourse < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses , :odm_member_id
    add_column :courses , :odm_key, :string
  end
end
