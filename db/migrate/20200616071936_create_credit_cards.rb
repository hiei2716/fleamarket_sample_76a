class CreateCredit_Cards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_credit_cards do |t|
      t.references :user_id, foreign_key: true, null: false
      t.string :customer_id, null: false
      t.string :credit_card_id, null: false
      t.timestamps
    end
  end
end
