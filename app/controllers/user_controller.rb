class UserController < ApplicationController
  before_action :fetch_user

  def index
  end

  def add
  end

  def store_money
  end

  def transactions
  end

  def fetch_user
    @user = User.find(current_user.id)
  end
end
