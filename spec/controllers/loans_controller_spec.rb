require 'rails_helper'
require 'rspec/json_expectations'

RSpec.describe LoansController, type: :controller do
  describe '#index' do
    context 'when no loans exist' do
      it 'responds with a 200' do
        get :index
        expect(response).to have_http_status(:ok)
      end
      it 'includes an empty loan array' do
        get :index
        expect(response.body).to eq("[]")
      end
    end
    context 'when a loan exists' do
      before do
        loan = Loan.create!(funded_amount: 100)
        get :index
        @body = parse_json_array(response.body)
      end
      it 'includes an id' do
        expect(@body['id']).to eq(1)
      end

      it 'includes a funded_amount' do
        expect(@body['funded_amount']).to eq("100.0")
      end
      it 'includes a balance' do
        expect(@body['balance']).to eq("100.0")
      end
    end
  end

  describe '#show' do
    context 'when the loan exists' do
      before do
        @loan = Loan.create!(funded_amount: 100)
        get :show, id: @loan.id
        @body = parse_json(response.body)
      end

      it 'responds with a 200' do
        get :show, id: @loan.id
        expect(response).to have_http_status(:ok)
      end
      it 'includes an id' do
        expect(@body['id']).to eq(1)
      end

      it 'includes a funded_amount' do
        expect(@body['funded_amount']).to eq("100.0")
      end
      it 'includes a balance' do
        expect(@body['balance']).to eq("100.0")
      end
    end

    context 'when the loan doesnt exist' do
      it 'responds with a 404' do
        get :show, id: 10000
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  def parse_json_array body
    JSON.parse(body).first
  end
  def parse_json body
    JSON.parse(body)
  end

end
