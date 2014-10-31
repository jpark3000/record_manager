# encoding: utf-8

require 'record_manager/parser'

describe RecordManager::Parser do
  let(:parser) { RecordManager::Parser.new }
  let(:record_array) { Array.new(5, RecordManager::Record) }

  it 'loads a pipe delimited text file into an array of record objects' do
    records = parser.load_records('pipes.txt')
    expect(records.map(&:class)).to match_array record_array
  end

  it 'loads a space delimited text file into an array of record objects' do
    records = parser.load_records('spaces.txt')
    expect(records.map(&:class)).to match_array record_array
  end

  it 'loads a text delimited text file into an array of record objects' do
    records = parser.load_records('commas.txt')
    expect(records.map(&:class)).to match_array record_array
  end

  it 'parses a record correctly' do
    record = parser.load_records('pipes.txt').first
    expect(record.to_output).to eql "Jarmusch, Jim, Male, Black, 1/22/1953"
  end
end