class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :card_number
      t.string :security_code
      t.string :expiration_date

      t.timestamps null: false
    end
  end
end
