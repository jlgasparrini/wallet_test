class CreditCard < ActiveRecord::Base
  # == Validations
  validate  :valid_cc_number
  validates :expiration_date,
    format: { with: /\b(0[1-9]|1[0-2])\/2([0-9][0-9][0-9])\b/,
              message: "only allow format MM/YYYY" }
  validates :security_code, length: { is: 3 }

  private

    def valid_cc_number
      if CreditCardSanitizer.new('*').sanitize!(self.card_number).nil?
        errors.add(:card_number, 'is invalid')
      end
    end
end
