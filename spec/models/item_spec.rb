require 'rails_helper'
describe Item do
  describe '#create' do
    it "name, description, category_id, user_id, brand_id, condition_id, postage, prefecture_id, wait, price, imagesが存在すれば登録できる" do
      @item = build(:item)
      expect(@item).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
  end
end