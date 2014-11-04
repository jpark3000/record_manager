# encoding: utf-8

require 'spec_helper'

describe RecordManager::APIHelpers do
  class TestClass
    include RecordManager::APIHelpers
  end

  let(:test_class) { TestClass.new }

  it 'only returns one instance of RecordManager::Records class' do
    first_records_obj = test_class.records
    second_records_obj = test_class.records
    expect(first_records_obj).to eq second_records_obj
  end

  it 'only returns one instance of RecordManager::Parser class' do
    first_parser_obj = test_class.parser
    second_parser_obj = test_class.parser
    expect(first_parser_obj).to eq second_parser_obj
  end
 
  it 'correctly formats an array of record objects' do
    data = test_class.to_rest(test_records)
    expect(data.map(&:class)).to match_array Array.new(5, Hash)
  end
end