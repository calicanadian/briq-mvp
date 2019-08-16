module Records
  class SortRecords < Struct.new(:file_url, :briq)
    require 'uri'
    def enqueue(job)
    end

    def success(job)
    end

    def error(job, exception)
      Rails.logger.error "Records SortRecords Error: #{exception.message}"
    end

    def failure(job)

    end

    def before(job)

    end

    def max_attempts
      2
    end

    def after(job)

    end

    def record_render(record)
      ApplicationController.renderer.render(
        partial: 'records/record',
        locals: { record: record }
      )
    end

    def perform
      # do some file read stuff here.
      file = Roo::Spreadsheet.open(URI.encode(file_url))
      file.each_with_pagename do |name, sheet|
        # get each row excluding the headers
        sheet.each_row_streaming(offset: 1) do |row|
          record = Record.new(
            record_index: row[1], # record_id
            date_open: row[2], # date_open
            record_status: row[3], # record_status
            record_location: row[5], # Full
            record_type: row[11], # record_type_4level
            description: row[13], # description
            planner: row[14], # planner_id
            record_module: row[15], # module
            city: row[16], # City
            state: row[17], # State
            zip_code: row[18] # Zip
          )
          record.save!
          is_construction = record.description.blank? ? false : record.description.scan(/commercial|retail|high-rise/i).count > 0
          briq_record = BriqRecord.new(record_id: record.id, briq_id: briq.id, is_construction: is_construction)
          briq_record.save!
          if briq_record.is_construction
            ActionCable.server.broadcast "briq_imports_channel", record: record_render(record)
          end
        end
      end
    end
  end
end
