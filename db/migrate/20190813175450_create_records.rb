class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :record_index
      t.string :date_open
      t.string :record_status
      t.string :record_location
      t.string :record_type
      t.text :description
      t.string :planner
      t.string :record_module
      t.string :city
      t.string :state
      t.integer :zip_code

      t.timestamps
    end
  end
end
