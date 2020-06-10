class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :family_name, null:false
      t.string :family_name_kana, null:false
      t.string :first_name_kana, null:false
      t.string :postal_code, null:false
      t.string :city, null:false
      t.string :local, null:false
      t.string :house_number, null:false
      t.string :building_name
      t.integer :phone_number
      t.references :user, null: false
      
      t.timestamps
    end
    add_index       :addresses, :city
    add_foreign_key :addresses, :users
  end
end
