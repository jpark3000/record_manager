# encoding: utf-8

require 'record_manager/record'

describe RecordManager::Record do
    let(:record) { RecordManager::Record.new({ first_name: 'Justin', 
                                               last_name: 'Park', 
                                               gender: 'Male', 
                                               favorite_color: 'Blue', 
                                               dob: '12-11-1987' }) } 
  it 'instantiates a record' do
    expect(record).to be_instance_of(RecordManager::Record)
  end
end