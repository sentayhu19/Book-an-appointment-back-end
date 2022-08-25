require 'swagger_helper'

RSpec.describe 'Motorcycles', type: :request do
  path '/api/motorcycles' do
    parameter name: 'user_id', in: :query, type: :integer, description: 'user_id'
    get('list motorcycles') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
    post('create motorcycle') do
      consumes 'application/json', 'application/xml'
      parameter name: :motors, in: :body, schema: {
        type: :object,
        properties: {
          motors: {
            type: :object,
            properties: {
              model: { type: :string },
              price: { type: :integer },
              description: { type: :string },
              duration_months: { type: :integer }
            }
          }
        }
      }
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
  path '/api/motorcycles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show motorcycle') do
      response(200, 'successful') do
        let(:id) { '123' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
    patch('update motorcycle') do
      consumes 'application/json', 'application/xml'
      parameter name: :motors, in: :body, schema: {
        type: :object,
        properties: {
          motors: {
            type: :object,
            properties: {
              model: { type: :string },
              price: { type: :integer },
              description: { type: :string },
              duration_months: { type: :integer }
            }
          }
        }
      }
      response(200, 'successful') do
        let(:id) { '123' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
  path '/api/motorcycles/{id}' do
    put('update motorcycles') do
      consumes 'application/json', 'application/xml'
      parameter name: :motors, in: :body, schema: {
        type: :object,
        properties: {
          motors: {
            type: :object,
            properties: {
              model: { type: :string },
              price: { type: :integer },
              description: { type: :string },
              duration_months: { type: :integer }
            }
          }
        }
      }
      response(200, 'successful') do
        let(:id) { '123' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
    delete('delete motorcycle') do
      response(200, 'successful') do
        let(:id) { '123' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
