class Active < ApplicationRecord
  validates :name, :amount, :open_in, presence: true

  def percent amount_ref
    return 0 if amount_ref.zero?

    diff = self.amount*100
    diff = diff / amount_ref.to_i
    diff -= 100
    diff.round(2).to_f
  end
end
