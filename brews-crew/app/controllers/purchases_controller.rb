class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def index
    @purchases = Purchase.all
  end

  def destroy
    @purchase.destroy
    redirect_to purchases_path
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.create(purchase_params)
    redirect_to @purchase
  end

  def update
    @purchase.update(purchase_params)
    redirect_to @purchase
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:customer_name, :price, :brew_id)
  end
end
