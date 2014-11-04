# encoding: utf-8

require 'csv'

module RecordManager
  class Parser

    def load_file(file)
      records = []
      first_line = extract_first_line(file)
      CSV.foreach(file, col_sep: detect_delimiter(first_line)) do |record|
        records << parse_record(record)
      end
      records
    end

    def load_data_line(line)
      line = CSV.parse(line, col_sep: detect_delimiter(line)).flatten
      parse_record(line)
    end

    private

    def extract_first_line(file)
      File.open(file).first
    end

    def parse_record(attributes)
      strip_attributes!(attributes)
      Record.new(*attributes)
    end

    def detect_delimiter(line)
      case line
      when /\|/
        '|'
      when /,/
        ','
      else
        ' '
      end
    end

    def strip_attributes!(attributes)
      attributes.each(&:strip!)
    end
  end
end