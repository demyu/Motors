class Driver < ApplicationRecord
  has_many :money_transaction
  belongs_to :motor

  def transaction_range start_date: DateTime.now.beginning_of_year, end_date: DateTime.now
    transactions.where('created_at between ? and ?', start_date, end_date)
  end
end