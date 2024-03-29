class OrdersController < ApplicationController
  before_action :move_top_page
  before_action :authenticate_user!
  before_action :set_item

  def new
    @order_address = OrderAddress.new
    return unless @item.order

    redirect_to root_path
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item(@item)
      @order_address.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:post_address, :prefecture_id, :city_ward_town_village, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item(item)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def move_top_page
    item = Item.find(params[:item_id])
    user = User.find(item.user_id)
    return unless user_signed_in? && current_user.id == user.id

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
