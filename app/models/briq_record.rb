class BriqRecord < ApplicationRecord
  belongs_to :briq
  belongs_to :record

  def self.get_construction_records(briq_id)
    sql_str = <<-EOS
      SELECT briq_records.*, records.*
      FROM briq_records
      LEFT OUTER JOIN records ON briq_records.record_id = records.id
      WHERE briq_records.briq_id = #{briq_id}
      AND (records.description ILIKE '%commercial' OR
            records.description ILIKE '%Commercial' OR
            records.description ILIKE '%retail' OR
            records.description ILIKE '%Retail' OR
            records.description ILIKE '%high-rise' OR
            records.description ILIKE '%High-Rise' OR
            records.description ILIKE '%High-rise'
          )
      ORDER BY records.record_index ASC
    EOS
  end
end
