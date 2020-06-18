FactoryBot.define do
  factory :invalid_item do
    name {""}
    description {""}
    user_id {nil}
    brand_id {nil}
    condition_id {nil}
    postage {""}
    prefecture_id {nil}
    wait {""}
    price {nil}
    buyer_id {nil}

    trait :with_image do |item|
      after(:build) do |item|
        item.images << build(:image)
      end
    end
    
    association :category
  end
end