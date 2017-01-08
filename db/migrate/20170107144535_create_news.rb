class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :desc
      t.string :image
      t.text :writer
      t.string :status
      t.text :link

      t.timestamps
    end
  end
end
