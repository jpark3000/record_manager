# encoding: utf-8

require 'record_manager/sorter'

describe RecordManager::Sorter do
  let(:sorter) { RecordManager::Sorter.new(RecordManager::Parser.new.load_records('pipes.txt')) }
  let(:gender_sorted) { sorter.by_gender }
  
  it 'sorts records by gender' do
    expect(gender_sorted.map(&:gender)).to eql %W(Female Female Male Male Male)
  end

  it 'sorts gender sorted records by last name ascending' do
    expect(gender_sorted.map(&:last_name)).to eql %W(Campion Reichardt Anderson Herzog Jarmusch)
  end

  it 'sorts records by date of birth ascending' do
    dates = [
      '1942-09-05', '1953-01-22', '1954-04-30', 
      '1964-10-03', '1970-06-26'
    ].map { |date| Date.parse(date) }

    expect(sorter.by_dob.map(&:dob)).to eql dates
  end

  it 'sorts records by last name ascending' do
    expect(sorter.by_last_name.map(&:last_name)).to eql %W(Anderson Campion Herzog Jarmusch Reichardt)
  end
end