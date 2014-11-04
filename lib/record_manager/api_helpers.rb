#encoding: utf-8

module RecordManager
  module APIHelpers
    def records
      @records ||= RecordManager::Records.new
    end

    def parser
      @parser ||= RecordManager::Parser.new
    end

    def populate_records
      ['spaces.txt', 'pipes.txt', 'commas.txt'].each do |file|
        records.add_records(parser.load_file(file))
      end
    end

    def to_rest(records)
      records.map(&:to_rest)
    end
  end
end