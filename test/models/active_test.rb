require "test_helper"

class ActiveTest < ActiveSupport::TestCase
  def setup
    @active = Active.new(
      name: 'PETR4.SA', 
      amount: 32.5977678867,
      open_in: "2022-10-30 12:00:00"
    )
  end

  test 'valid active' do
    assert @active.valid?
  end

  test 'invalid without name' do
    @active.name = nil
    refute @active.valid?, 'saved active without a name'
    assert_not_nil @active.errors[:name], 'no validation error for name present'
  end

  test 'invalid without amount' do
    @active.amount = nil
    refute @active.valid?
    assert_not_nil @active.errors[:amount]
  end

  test 'invalid without open_in' do
    @active.open_in = nil
    refute @active.valid?
    assert_not_nil @active.errors[:open_in]
  end
end
