FactoryBot.define do
  factory :item do
    name {"テストアイテム"}
    description {"これはテストです"}
    user_id {1}
    brand_id {1}
    condition_id {1}
    postage {"送料込み"}
    prefecture_id {1}
    wait {"1~2日で発送"}
    price {500}
    buyer_id {nil}

    trait :with_image do |item|
      after(:build) do |item|
        item.images << build(:image)
      end
    end
    association :category
  end
end