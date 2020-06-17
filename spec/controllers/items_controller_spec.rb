require 'rails_helper'

describe ItemsController do
  describe 'GET #edit' do
    it "@itemに正しい値が入っていること" do
      item = create(:item)
      get :edit, params: { id: item }
      expect(assigns(:item)).to eq item
    end

    it "edit.html.hamlに遷移すること" do
      item = create(:item)
      get :edit, params: { id: tweet }
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    it "itemに期待した値が入っていること" do
      item = create(:item)
      patch :update, params: { id: item }
      expect(assigns(:item)).to eq item
    end

    it "itemの値が更新されていること"
      item = create(:item)
      patch :update, id: item, item: ??_??(:item)
      item.reload
      expect(assigns(:item))to. eq item
    end

    it "データベースに値が更新されない" do
    end
end