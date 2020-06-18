FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkkk@gmail.com"}
    password              {"shinnkt"}
    password_confirmation {"shinnkt"}
    family_name           {"中井"}
    first_name            {"真"}
    family_name_kana      {"ナカイ"}
    first_name_kana       {"シン"}
    birth_date            {"2000/10/10"}
    phone_number          {"08012341234"}
    gender               {1}
  end

end