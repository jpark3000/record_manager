# encoding: utf-8

require 'spec_helper'

describe RecordManager do
  let(:records) { RecordManager::Records.new }

  it 'initializes with an empty collection' do
    expect(records.collection).to be_empty
  end

  context 'when adding records' do
    before do
      records.add_records(test_records)
    end
    
    it 'can add an array of records to the collection' do
      expect(records.collection.size).to eql 5
    end

    it 'can add a single record object to the collection' do
      records.add_records(RecordManager::Record.new('Park', 'Justin', 'Male', 'Blue', '12-11-1987'))
      expect(records.collection.size).to eql 6
    end
  
    context 'when sorting records' do
      let(:gender_sorted) { records.sort_gender }
      
      it 'sorts records by gender' do
        expect(gender_sorted.map(&:gender)).to eql %W(Female Female Male Male Male)
      end

      it 'sorts gender sorted records by last name ascending' do
        expect(gender_sorted.map(&:last_name)).to eql %W(Bouvier Krabappel Muntz Simpson Szyslak)
      end

      it 'sorts records by date of birth ascending' do
        dates = [
          '1949-11-20', '1955-05-12', '1958-01-24', 
          '1960-09-19', '1989-07-28'
        ].map { |date| Date.parse(date) }

        expect(records.sort_dob.map(&:dob)).to eql dates
      end

      it 'sorts records by last name ascending' do
        expect(records.sort_last_name.map(&:last_name)).to eql %W(Bouvier Krabappel Muntz Simpson Szyslak)
      end
    end
  end
end