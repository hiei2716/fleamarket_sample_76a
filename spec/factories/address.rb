FactoryBot.define do

  factory :address do
    family_name       {"田中"}
    first_name        {"太郎"}
    family_name_kana  {"タナカ"}
    first_name_kana   {"タロウ"}
    postal_code       {"1234568"}
    city              {"北海道"}
    local             {"札幌市"}
    block             {"1−10"}
    user_id              {1}
    phone_number         {"08012341234"}
    building            {"テックキャンプなんば校"}
  end

end