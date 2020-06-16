require 'rails_helper'
describe Item do
  describe '#create' do
    it "データが全て入力されていれば登録できる" do
      @item = build(:item)
      expect(@item).to be_valid
    end

    it "任意入力のbrand_idがなくても出品できる" do
      expect(build(:item, brand_id: nil)).to be_valid
    end

    it "nameがない場合は出品できない" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "descriptionがない場合は出品できない" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "user_idがない場合は出品できない" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end

    it "condition_idがない場合は出品できない" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it "postageがない場合は出品できない" do
      item = build(:item, postage: "")
      item.valid?
      expect(item.errors[:postage]).to include("can't be blank")
    end

    it "prefecture_idがない場合は出品できない" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "waitがない場合は出品できない" do
      item = build(:item, wait: "")
      item.valid?
      expect(item.errors[:wait]).to include("can't be blank")
    end

    it "priceがない場合は出品できない" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    # it "imageがない場合は出品できない" do
    #   item = build(:item, image: "")
    #   item.valid?
    #   expect(item.errors[:image]).to include("can't be blank")
    # end

    # # it "categoryがない場合は出品できない" do
    # #   item = build(:item, category: "")
    # #   item.valid?
    # #   expect(item.errors[:category]).to include("can't be blank")
    # # end
  end
end