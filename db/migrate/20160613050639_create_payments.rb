class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :loan_id
      t.decimal :amount
      t.date :date

      t.timestamps null: false
    end
  end
end
