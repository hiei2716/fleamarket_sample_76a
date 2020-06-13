# 76_a fleamarket_sample DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|password_confirmation|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_date|string|null: false|
|phone_number|string|null: false|
|gender|integer|null: false|
|introduction|text|
|user_image|string|

### Association
- has_one :addresses
- has_many :items
- has_many :comments
- has_one :credit_card, dependent: :destroy

### index
- add_index: [:nickname, :gender]

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null:false|
|first_name|string|null:false|
|family_name_kana|string|null: false|
|first_name_kana|string|null:false|
|postal_code|string|null:false|
|city|string|null:false|
|local|string|null:false|
|house_number|string|null:false|
|building_name|string|
|phone_number|integer|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

### index
- add_index: [:city, :user_id]

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|integer|null:false, unique: true|
|customer|integer|null:false|
|expiration_month|integer|null:false|
|security_code|integer|null:false|
|card|references|null: false, foreign_key: true|

### Association
- belongs_to:user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:：false|
|description|text|null: false|
|size|string|
|category|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|condition_id|integer|null: false|
|postage|integer|null: false|
|prefecture_id|integer|null: false|
|wait|string|null: false|
|price|integer|null: false|
|buyer_id|integer|

### Association
- belongs_to :user
- has_many :comments 
- has_many :images
- belongs_to :brand
- belongs_to :category
- has_many :images, dependent: :destroy
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category
- belongs_to_active_hash :brand


### index
- add_index: [:name, :price]

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user 
- belongs_to :item

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item, optional: true


### Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- has_many :items

### index
- add_index: [:gender, :name]


## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items