class Motor < ApplicationRecord
  has_many :driver
  has_many :money_transaction
end