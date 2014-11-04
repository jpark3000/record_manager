# encoding: utf-8

require 'grape'

module RecordManager
  class API < Grape::API
    format :json

    helpers RecordManager::APIHelpers

    resource :records do
      before do
        populate_records
      end

      desc 'Return records sorted by gender'
      get :gender do
        { records: to_rest(records.sort_gender) }
      end

      desc 'Return records sorted by birthdate'
      get :birthdate do
        { records: to_rest(records.sort_birthdate) }
      end

      desc 'Return records sorted by last name'
      get :name do
        { records: to_rest(records.sort_last_name) }
      end

      desc 'Create a record'
      params do
        requires :record, type: String, desc: 'Record attributes'
      end

      post do
        record = parser.load_data_line(params[:record])
        records.add_records(record)
        { record: record.to_rest }
      end
    end
  end
end