class CreateBriqRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :briq_records do |t|
      t.references :briq, foreign_key: true
      t.references :record, foreign_key: true
      t.boolean :is_construction

      t.timestamps
    end
  end
end
