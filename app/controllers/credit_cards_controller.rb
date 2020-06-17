class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
  end

  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    credit_card = Credit_Card.where(user_id: 1)
    #redirect_to action: "new" if credit_card.present?
  end

  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = 'sk_test_f1d2d99808bd87c9b416bd9c'

    if params['payjp-token'].blank?
      redirect_to action: "index"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録。
      customer = Payjp::Customer.create(
        description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        #metadata: {user_id: current_user.id} # 無くてもOK。
      )
      @credit_card = Credit_Card.new(user_id: 1, customer_id: customer.id, card_id: customer.default_card)
      if @credit_card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  private

  def set_card
    @credit_card = Credit_Card.where(params[:id]).first if Credit_Card.where(params[:id]).present?
  end
end
