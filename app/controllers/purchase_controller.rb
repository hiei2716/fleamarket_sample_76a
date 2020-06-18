class PurchaseController < ApplicationController

  require 'payjp'
  before_action :set_item,       only: [:index, :pay]
  before_action :set_card,       only: [:index, :pay]

  def index
    #@city = Prefecture.find(current_user.address.city).name
    @credit_card = Credit_Card.where(user_id: 2).first
    #仕上がり次第、current_user_idへ
    if @credit_card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "credit_cards", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.PAYJP[:PAYJP_ACCESS_KEY]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@credit_card.card_id)
    end
  end

  def pay
    @credit_card = Credit_Card.where(user_id: 2).first
    #仕上がり次第、current_user_idへ
    Payjp.api_key = Rails.application.credentials.PAYJP[:PAYJP_ACCESS_KEY]
    Payjp::Charge.create(
    :amount => 34439,
    :customer => @credit_card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
    )
    #@item.buyer_id = 0
    #@item.buyer_id = @item.buyer_id + current_user.id
    #@item.save
    redirect_to action: 'done' #完了画面に移動
  end

  private
  def set_item
    @item = Item.where(item_id: 1)
    #仕上がり次第、paramsに変更
  end

  def set_card
    @credit_card = Credit_Card.where(user_id: 2).first
    #仕上がり次第、current_user_idへ
  end

end
