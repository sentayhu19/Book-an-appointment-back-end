require 'swagger_helper'

RSpec.describe 'Registration API' do
  path '/api/users/sign_in' do
    post 'Creates a token' do
      tags 'Login'
      consumes 'application/json', 'application/xml'
      parameter name: :login, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string }
            }
          }
        },
        required: %w[name]
      }
      response '201', 'token created' do
        let(:login) { { name: 'Temesgen' } }
        run_test!
      end
      response '422', 'invalid request' do
        let(:login) { '' }
        run_test!
      end
    end
  end
  path '/api/users' do
    post 'Creates a token' do
      tags 'Signup'
      consumes 'application/json', 'application/xml'
      parameter name: :signup, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string }
            }
          }
        },
        required: %w[name]
      }
      response '200', 'token created' do
        let(:signup) { { name: 'Temesgen' } }
        run_test!
      end
      response '422', 'invalid request' do
        let(:signup) { '' }
        run_test!
      end
    end
  end
end
