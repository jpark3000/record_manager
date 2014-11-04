# encoding: utf-8

require 'spec_helper'

describe RecordManager::Parser do
  let(:parser) { RecordManager::Parser.new }
  let(:record_array) { Array.new(5, RecordManager::Record) }

  context 'when parsing a file' do
    it 'loads a pipe delimited text file into an array of record objects' do
      records = parser.load_file('pipes.txt')
      expect(records.map(&:class)).to match_array record_array
    end

    it 'loads a space delimited text file into an array of record objects' do
      records = parser.load_file('spaces.txt')
      expect(records.map(&:class)).to match_array record_array
    end

    it 'loads a text delimited text file into an array of record objects' do
      records = parser.load_file('commas.txt')
      expect(records.map(&:class)).to match_array record_array
    end
  end

  context 'when parsing a single data line' do
    it 'handles a pipe delimited string' do
      expect(parser.load_data_line('Park | Justin | Male | Blue | 12-11-1987'))
        .to be_instance_of RecordManager::Record
    end

    it 'handles a comma delimited string' do
      expect(parser.load_data_line('Park, Justin, Male, Blue, 12-11-1987'))
        .to be_instance_of RecordManager::Record
    end

    it 'handles a space delimted string' do
      expect(parser.load_data_line('Park, Justin, Male, Blue, 12-11-1987'))
        .to be_instance_of RecordManager::Record
    end
  end

  it 'parses a record correctly' do
    record = parser.load_file('pipes.txt').first
    expect(record.to_output).to eql "Jarmusch, Jim, Male, Black, 1/22/1953"
  end
end