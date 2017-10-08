class CreateCms < ActiveRecord::Migration[5.0]
  def change
    create_table :cms do |t|
      t.string :title
      t.string :tagid
      t.text :content
      t.integer :viewer
      t.string :seo_title
      t.text :seo_description

      t.timestamps
    end
  end
end
