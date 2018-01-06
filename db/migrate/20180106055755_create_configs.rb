class CreateConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :configs do |t|
      t.integer :current_year

      t.timestamps
    end
  end
end
