class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null:false
      t.string :size
      t.references :category, null: false,　foreign_key: true
      t.references :user, type: :bigint, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.string :condition, null: false
      t.integer :postage, null: false
      t.integer :prefecture, null: false
      t.string :wait, null: false
      t.integer :price, null: false
      t.integer :buyer_id
      t.timestamps
    end
  end
end
