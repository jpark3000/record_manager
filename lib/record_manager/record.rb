# encoding: utf-8

module RecordManager
  class Record
    attr_reader :first_name, :last_name, :gender, :favorite_color, :dob

    def initialize(last_name, first_name, gender, favorite_color, dob)
      @last_name = last_name
      @first_name = first_name
      @gender = gender
      @favorite_color = favorite_color
      @dob = Date.strptime(dob, ' %m-%d-%Y')
    end

    def format
      "#{last_name}, #{first_name}, #{gender}, #{favorite_color}, #{dob.strftime('%-m/%-d/%Y')}"
    end
  end
end