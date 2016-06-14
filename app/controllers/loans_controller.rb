class LoansController < ApplicationController

  def index
    render json: Loan.all.to_json(:only=> [:id, :funded_amount], :methods => :balance)
  end

  def show
    render json: Loan.find(params[:id]).to_json(:only => [:id, :funded_amount], :methods => :balance)
  end
end
