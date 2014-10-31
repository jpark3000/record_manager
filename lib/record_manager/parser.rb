# encoding: utf-8

require 'csv'

module RecordManager
  class Parser

    def load_records(file)
      records = []
      CSV.foreach(file, col_sep: detect_delimiter(file)) do |record|
        records << parse_record(record)
      end
      records
    end

    private

    def parse_record(row)
      strip_row!(row)
      Record.new(*row)
    end

    def detect_delimiter(file)
      first_line = File.open(file).first
      case first_line
      when /\|/
        '|'
      when /,/
        ','
      else
        ' '
      end
    end

    def strip_row!(row)
      row.each(&:strip!)
    end
  end
end