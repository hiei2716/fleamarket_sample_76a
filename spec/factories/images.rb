FactoryBot.define do
  factory :image do
    src {File.open("#{Rails.root}/app/assets/images/logo.png")}
  end
end