class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_number, :pref_id, :city, :street_address, :telephone_number, :building).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def move_to_index
    return if current_user.id != @item.user_id && @item.purchase_history.nil?

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
