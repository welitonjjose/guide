require 'test_helper'

class ActiveServiceTest < ActiveSupport::TestCase
  test '#call new Active' do
    active_Service = ActiveService.new("PETR4.SA")
    
    assert active_Service.call
  end

  test '#call with active not exist' do
    active_Service = ActiveService.new("PETR4SA")
    
    assert active_Service.call
  end
end