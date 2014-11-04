# encoding: utf-8

require 'spec_helper'

describe RecordManager::Record do
  let(:record) { RecordManager::Record.new('Park', 'Justin', 'Male', 'Blue', '12-11-1987') } 
  
  it 'instantiates a record' do
    expect(record).to be_instance_of RecordManager::Record
  end

  it 'outputs a record correctly' do
    expect(record.to_output).to eql 'Park, Justin, Male, Blue, 12/11/1987'
  end
end