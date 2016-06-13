class PaymentsController < ApplicationController

  def index
    render json: Payment.all
  end

  def create
    loan = Loan.find(params[:loan_id])

    amount = params[:payment][:amount]
    date = params[:payment][:date]
    Payment.create!(amount: amount, date: date, loan: loan)
    render json: "ok"
  end

end
