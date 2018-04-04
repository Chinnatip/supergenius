class TrackStudtntSchool < ActiveRecord::Migration[5.0]
  def change
    add_column :students , :school_primary, :string
    add_column :students , :school_secondary, :string
    add_column :students , :school_university, :string
  end
end
