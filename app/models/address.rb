class Address < ApplicationRecord
  # アソシエーション
  belongs_to :user, optional: true
  # バリデーション
  validates :family_name, :first_name , :family_name_kana, :first_name_kana, :postal_code, :city, :local, :block,  presence: true

  # 文字の形式制限
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/,
    message: "全角文字のみが使えます" }
  validates :family_name_kana,:first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/,
    message: "全角カナのみが使えます" }

  # 文字数制限
  validates :postal_code, length: {in: 7..7}
end