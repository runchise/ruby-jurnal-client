# frozen_string_literal: true

require 'spec_helper'
require 'active_support'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/object/to_query'

RSpec.describe 'FaradayMiddleware::RaiseHttpException via JurnalApi::Client' do
  let(:client) { JurnalApi::Client.new(access_token: 'test-token') }
  let(:endpoint) { 'https://sandbox-api.jurnal.id/core/api/v1/sales_invoices/1.json' }

  it 'raises UnprocessableEntity on 422' do
    stub_request(:delete, endpoint)
      .to_return(status: 422, body: { errors: ['locked'] }.to_json, headers: { 'Content-Type' => 'application/json' })

    expect { client.sales_invoice_delete(1) }
      .to raise_error(JurnalApi::UnprocessableEntity) { |error|
        expect(error.message).to include('422')
        expect(error.body).to include('errors' => ['locked'])
      }
  end

  it 'raises NotFound on 404' do
    stub_request(:delete, endpoint).to_return(status: 404, body: {}.to_json)

    expect { client.sales_invoice_delete(1) }.to raise_error(JurnalApi::NotFound)
  end

  it 'does not raise on 200' do
    stub_request(:delete, endpoint).to_return(status: 200, body: {}.to_json)

    expect { client.sales_invoice_delete(1) }.not_to raise_error
  end
end
