class CreateNewsfeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :newsfeeds do |t|
      t.string :title
      t.text :desc
      t.string :writer
      t.string :image
      t.string :status
      t.string :link
      t.integer :viewer

      t.timestamps
    end
  end
end
