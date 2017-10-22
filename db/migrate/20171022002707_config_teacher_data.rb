class ConfigTeacherData < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers , :nickname, :string
    add_column :teachers , :note, :text
    change_column :teachers , :tel, :string
  end
end
