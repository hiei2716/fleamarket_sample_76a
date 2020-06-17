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
end