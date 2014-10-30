# encoding: utf-8

module RecordManager
  class Record
    attr_reader :first_name, :last_name, :gender, :favorite_color, :dob

    def initialize(attributes = {})
      @first_name = attributes[:first_name]
      @last_name = attributes[:last_name]
      @gender = attributes[:gender]
      @favorite_color = attributes[:favorite_color]
      @dob = attributes[:dob]
    end
  end
end