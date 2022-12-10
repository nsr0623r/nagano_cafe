class Admin::CustomersController < ApplicationController
  # 顧客一覧画面
  def index
    @customers = Customer.all
  end

  # 顧客詳細画面
  def show
    @customer = Customer.find(params[:id])
  end

  # 顧客編集画面
  def edit
  end
  
  # 顧客情報の更新
  def update
  end
end
