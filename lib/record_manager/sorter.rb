# encoding: utf-8

module RecordManager
  class Sorter
    attr_reader :records

    def initialize(records)
      @records = records
    end

    def by_gender
      records.sort_by { |record| [record.gender, record.last_name] }
    end

    def by_dob
      records.sort_by { |record| record.dob }
    end

    def by_last_name
      records.sort_by { |record| record.last_name }
    end
  end
end