class BriqRecord < ApplicationRecord
  belongs_to :briq
  belongs_to :record

  def self.get_construction_records(briq_id)
    sql_str = <<-EOS
      SELECT records.*, briq_records.id
      FROM records
      INNER JOIN briq_records ON briq_records.record_id = records.id
      WHERE briq_records.briq_id = #{briq_id}
      AND briq_records.is_construction = true
      ORDER BY records.record_index ASC
    EOS

    ActiveRecord::Base.connection.execute(sql_str)
  end
end
