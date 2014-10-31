# encoding: utf-8

require 'record_manager/record'

describe RecordManager::Record do
  let(:record) { RecordManager::Record.new('Park', 'Justin', 'Male', 'Blue', '12-11-1987') } 
  
  it 'instantiates a record' do
    expect(record).to be_instance_of RecordManager::Record
  end
end