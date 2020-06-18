class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
  end

  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    credit_card = Credit_Card.where(user_id: 2)
    #redirect_to action: "new" if credit_card.present?
  end

  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = Rails.application.credentials.PAYJP[:PAYJP_ACCESS_KEY]

    if params['payjp-token'].blank?
      redirect_to action: "index"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録。
      customer = Payjp::Customer.create(
        description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        #metadata: {user_id: current_user.id} # 無くてもOK。
      )
      @credit_card = Credit_Card.new(user_id: 2, customer_id: customer.id, card_id: customer.default_card)
      if @credit_card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    if @credit_card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.PAYJP[:PAYJP_ACCESS_KEY]
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      @default_card_information = customer.cards.retrieve(@credit_card.card_id)
    end
  end

  def destroy #PayjpとCardデータベースを削除します
    unless @credit_card.blank?
      Payjp.api_key =  Rails.application.credentials.PAYJP[:PAYJP_ACCESS_KEY]
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      customer.delete
      @credit_card.delete
    end
  end

  private

  def set_card
    @credit_card = Credit_Card.where(id: 5).first if Credit_Card.where(id: 5).present?
  end
end
