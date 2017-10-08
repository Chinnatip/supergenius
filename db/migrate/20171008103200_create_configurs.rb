class CreateConfigurs < ActiveRecord::Migration[5.0]
  def change
    create_table :configurs do |t|
      t.text :top_contact
      t.string :company_name
      t.text :contact_info
      t.text :home_slider

      t.timestamps
    end
  end
end
