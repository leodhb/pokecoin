class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_user

  def index
  end

  def add
  end

  def store_money
    amount = params[:amount].values.first
    @user.update(balance: @user.balance + BigDecimal(amount))

    redirect_to user_index_path
  end

  def transactions
  end

  def fetch_user
    @user = User.find(current_user.id)
  end
end
