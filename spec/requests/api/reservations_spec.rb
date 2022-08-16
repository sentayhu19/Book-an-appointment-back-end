require 'swagger_helper'

RSpec.describe 'Reservations API' do
  path '/api/reservations' do
    get 'Retrieves reservations' do
      tags 'Reservations'
      produces 'application/json', 'application/xml'

      response '200', 'name found' do
        schema type: :object,
               properties: {
                 date: { type: :string },
                 user: { type: :string },
                 motor_id: { type: :id }
               },
               required: %w[date user motor_id]

        run_test!
      end

      response '404', 'pet not found' do
        run_test!
      end
    end
  end

  path '/api/reservations' do
    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json', 'application/xml'
      security [ApiKeyAuth: []]

      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string },
          user: { type: :integer },
          motor_id: { type: :integer }

        },
        required: %w[date user motor_id]
      }

      response '201', 'Reservation created' do
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { 'foo' }
        run_test!
      end
    end
  end
end