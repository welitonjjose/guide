require "test_helper"

class RoutesTest < ActionController::TestCase
  def test_routes
    assert_routing '/search', controller: "chart", action: "show", format: :json
    assert_routing '/', controller: "chart", action: "index", format: :json
  end
end