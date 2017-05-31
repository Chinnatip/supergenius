class CreateQuotations < ActiveRecord::Migration[5.0]
  def change
    create_table :quotations do |t|
      t.text :title
      t.text :desc

      t.timestamps
    end
  end
end
