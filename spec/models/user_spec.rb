require 'rails_helper'

describe User do
  describe '#create' do

    it "全てのカラムに値が存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
     user = build(:user, nickname: nil)
     user.valid?
     expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it"password_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end


    it "passwordが7文字以上であれば登録ができること" do
      user = build(:user, password: "shinnkt", password_confirmation: "shinnkt")
      user.valid?
      expect(user).to be_valid
     end

    it "passwordが６文字以下だと登録ができないこと" do
      user = build(:user, password: "shinnk", password_confirmation: "shinnk")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
     end


    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "family_nameが全角でない場合は登録できないこと" do
      user = build(:user, family_name: "asdfg")
      user.valid?
      expect(user.errors[:family_name]).to include("全角文字のみが使えます")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "first_nameが全角でない場合は登録できないこと" do
      user = build(:user, first_name: "asdfg")
      user.valid?
      expect(user.errors[:first_name]).to include("全角文字のみが使えます")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    it "family_name_kanaが全角カナでない場合は登録できないこと" do
      user = build(:user, family_name_kana: "asdf")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カナのみが使えます")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaが全角カナでない場合は登録できないこと" do
      user = build(:user, first_name_kana: "asdf")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("全角カナのみが使えます")
    end

    it "birth_dateがない場合は登録できないこと" do
      user = build(:user, birth_date: "")
      user.valid?
      expect(user.errors[:birth_date]).to include("can't be blank")
    end

    it "phone_numberがない場合は登録できないこと" do
      user = build(:user, phone_number: "")
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end

    it "genderがない場合は登録できないこと" do
      user = build(:user, gender: "")
      user.valid?
      expect(user.errors[:gender]).to include("can't be blank")
    end

  end
end