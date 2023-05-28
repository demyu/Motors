class MoneyTransaction < ApplicationRecord

  belongs_to :driver, optional: false
  belongs_to :motor, optional: false

  VALID_STATUS = [:pending, :paid, :returned]
  VALID_TYPES  = [:payment, :expenses, :lended]

  validates :status, presence: true, inclusion: { in: VALID_STATUS}
  validates :type, presence: true, inclusion: { in: VALID_TYPES}

end