require 'swagger_helper'

RSpec.describe 'api/reservations', type: :request do
  path '/api/reservations' do
    # You'll want to customize the parameter types...
    parameter name: :user_id, in: :query, type: :integer
    get('list reservations') do
      response(200, 'successful') do
        let(:user_id) { '123' }
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
    post('create reservation') do
      parameter name: :motor_id, in: :query, type: :integer
      consumes 'application/json', 'application/xml'
      parameter name: :reservations, in: :body, schema: {
        type: :object,
        properties: {
          reservations: {
            type: :object,
            properties: {
              city: { type: :string },
              date: { type: :string }
            }
          }
        }
      }
      response(200, 'successful') do
        let(:user_id) { '123' }
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
  path '/api/reservations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :integer, description: 'id'
    get('show reservation') do
      response(200, 'successful') do
        let(:user_id) { '123' }
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
    patch('update reservation') do
      consumes 'application/json', 'application/xml'
      parameter name: :reservations, in: :body, schema: {
        type: :object,
        properties: {
          reservations: {
            type: :object,
            properties: {
              city: { type: :string },
              date: { type: :string }
            }
          }
        }
      }
      response(200, 'successful') do
        let(:user_id) { '123' }
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
  path '/api/reservations/{id}' do
    put('update reservation') do
      consumes 'application/json', 'application/xml'
      parameter name: :reservations, in: :body, schema: {
        type: :object,
        properties: {
          reservations: {
            type: :object,
            properties: {
              city: { type: :string },
              date: { type: :string }
            }
          }
        }
      }
      response(200, 'successful') do
        let(:user_id) { '123' }
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
    delete('delete reservation') do
      response(200, 'successful') do
        let(:user_id) { '123' }
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
