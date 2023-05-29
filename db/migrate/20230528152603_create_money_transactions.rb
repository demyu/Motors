class CreateMoneyTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :money_transactions do |t|
      t.float  :amount, :default => 0
      t.string :status, :default => :pending, null: false
      t.string :payment_type, null: false
      t.string :notes
      t.belongs_to :motor, foreign_key: true, null: false
      t.belongs_to :driver, foreign_key: true, null: false
    end
  end
end
