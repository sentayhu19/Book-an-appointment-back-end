require 'swagger_helper'

RSpec.describe 'Registration API' do
  path '/auth/login' do
    post 'Creates a token' do
      tags 'Login'
      consumes 'application/json', 'application/xml'
      parameter name: :login, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string }
        },
        required: %w[username]
      }

      response '201', 'token created' do
        let(:login) { { username: 'Temesgen' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:login) { '' }
        run_test!
      end
    end
  end

  path '/auth/signup' do
    post 'Creates a token' do
      tags 'Signup'
      consumes 'application/json', 'application/xml'
      parameter name: :signup, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string }
        },
        required: %w[username]
      }

      response '201', 'token created' do
        let(:signup) { { username: 'Temesgen' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:signup) { '' }
        run_test!
      end
    end
  end
end
