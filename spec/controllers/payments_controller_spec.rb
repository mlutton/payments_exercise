require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe '#index' do
    it 'responds with a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    context 'with a valid loan' do
      let(:loan) { Loan.create!(funded_amount: 500) }

      it 'responds with a 200' do
        post :create, payment: {amount: 500}, loan_id: loan.id
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with an empty loan param' do
      it 'responds with a not found' do
        post :create, payment: {amount: 500}
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'with an invalid loan param' do
      it 'responds with a not found' do
        post :create, payment: {amount: 500}, loan_id: 1000
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
