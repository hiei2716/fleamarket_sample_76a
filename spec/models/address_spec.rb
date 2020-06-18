require 'rails_helper'

describe Address do
  describe '#create' do

    it "全てのカラムに値が存在すれば登録できること" do
      user = build(:user)
      address = build(:address, user_id: user.id)
      address.valid?
      expect(address).to be_valid
    end

    it "family_nameがない場合は登録できないこと" do
      user = build(:user)
      address = build(:address, user_id: user.id, family_name: "")
      address.valid?
      expect(address.errors[:family_name]).to include("can't be blank")
    end


    it "family_nameが全角でない場合は登録できないこと" do
      user = build(:user)
      address = build(:address, user_id: user.id, family_name: "asdfg")
      address.valid?
      expect(address.errors[:family_name]).to include("全角文字のみが使えます")
    end


    it "first_nameがない場合は登録できないこと" do
      user = build(:user)
      address = build(:address, user_id: user.id, first_name: "")
      address.valid?
      expect(address.errors[:first_name]).to include("can't be blank")
    end

    it "first_nameが全角でない場合は登録できないこと" do
      user = build(:user)
      address = build(:address, user_id: user.id, first_name: "asdfg")
      address.valid?
      expect(address.errors[:first_name]).to include("全角文字のみが使えます")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user)
      address = build(:address, user_id: user.id, family_name_kana: "")
      address.valid?
      expect(address.errors[:family_name_kana]).to include("can't be blank")
    end

    it "family_name_kanaが全角カナでない場合は登録できないこと" do
      user = build(:user)
      address = build(:address, user_id: user.id, family_name_kana: "asdfg")
      address.valid?
      expect(address.errors[:family_name_kana]).to include("全角カナのみが使えます")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user)
      address = build(:address, user_id: user.id, first_name_kana: "")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaが全角カナでない場合は登録できないこと" do
      user = build(:user)
      address = build(:address, user_id: user.id, first_name_kana: "asdfg")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("全角カナのみが使えます")
    end

    it "postal_codeがない場合は登録できないこと" do
      user = build(:user)
      address = build(:address, user_id: user.id, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("can't be blank")
    end

    it "postal_codeは7文字以外の場合は登録ができないこと" do
      user = build(:user)
      address = build(:address, user_id: user.id, postal_code: "123456")
      address.valid?
      expect(address.errors[:postal_code]).to include("is too short (minimum is 7 characters)")
    end

    it "postal_codeは7文字の場合のみ登録ができること" do
      user = build(:user)
      address = build(:address, user_id: user.id, postal_code: "1234567")
      address.valid?
      expect(address).to be_valid
    end

    it "cityがない場合は登録できないこと" do
      user = build(:user)
      address = build(:address, user_id: user.id, city: "")
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    it "localがない場合は登録できないこと" do
      user = build(:user)
      address = build(:address, user_id: user.id, local: "")
      address.valid?
      expect(address.errors[:local]).to include("can't be blank")
    end

    it "blockがない場合は登録できないこと" do
      user = build(:user)
      address = build(:address, user_id: user.id, block: "")
      address.valid?
      expect(address.errors[:block]).to include("can't be blank")
    end

    it "phone_numberはなくても登録はできること" do
      user    = build(:user)
      address = build(:address, user_id: user.id, phone_number: "")
      address.valid?
      expect(address).to be_valid
    end

    it "buildingはなくても登録はできること" do
      user    = build(:user)
      address = build(:address, user_id: user.id, building: "")
      address.valid?
      expect(address).to be_valid
    end

  end
end