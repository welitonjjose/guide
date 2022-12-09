require "test_helper"

class ChartControllerTest < ActionDispatch::IntegrationTest
  def setup
    @active = actives(:one)
  end
  
  test "should get show" do
    get :show, params: { active: "PETR4.SA"}
    assert_response :success
  end

  test "should get index" do
    get '/'
    assert_response :redirect
  end
end
