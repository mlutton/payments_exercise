class PaymentsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    render json: Payment.all
  end

  def create
    loan = Loan.find(params[:loan_id])

    amount = params[:amount]
    date = params[:date]
    Payment.create!(amount: amount, date: date, loan: loan)
    render json: "ok"
  end

end
