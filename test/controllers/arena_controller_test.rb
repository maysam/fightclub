require 'test_helper'

class ArenaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get arena_index_url
    assert_response :success
  end

end
