# encoding: utf-8

module RecordManager
  class Record
    attr_reader :first_name, :last_name, :gender, :favorite_color, :birthdate

    def initialize(last_name, first_name, gender, favorite_color, birthdate)
      @last_name = last_name
      @first_name = first_name
      @gender = gender
      @favorite_color = favorite_color
      @birthdate = Date.strptime(birthdate, '%m-%d-%Y')
    end

    def to_output
      "#{last_name}, #{first_name}, #{gender}, #{favorite_color}, #{birthdate.strftime('%-m/%-d/%Y')}"
    end

    def to_rest
      {
        last_name: last_name,
        first_name: first_name,
        gender: gender,
        favorite_color: favorite_color,
        birthdate: birthdate.strftime('%-m/%-d/%Y')
      }
    end
  end
end