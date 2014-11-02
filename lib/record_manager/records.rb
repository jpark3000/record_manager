# encoding: utf-8

module RecordManager
  class Records
    attr_reader :collection

    def initialize
      @collection = []
    end

    def add_records(records)
      collection << records
      collection.flatten!
    end

    def sort_gender
      collection.sort_by { |record| [record.gender, record.last_name] }
    end

    def sort_dob
      collection.sort_by { |record| record.dob }
    end

    def sort_last_name
      collection.sort_by { |record| record.last_name }
    end
  end
end