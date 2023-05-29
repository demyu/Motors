class MoneyTransaction < ApplicationRecord

  belongs_to :driver, optional: false
  belongs_to :motor, optional: false

  VALID_STATUS = ['pending', 'paid', 'returned']
  VALID_TYPES  = ['payment', 'expenses', 'lended']

  validates :status, presence: true, inclusion: { in: VALID_STATUS}
  validates :payment_type, presence: true, inclusion: { in: VALID_TYPES}

  def self.enum_status
    VALID_STATUS
  end

  def self.enum_types
    VALID_TYPES
  end
end