require 'test_helper'

class YoutubesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get youtubes_index_url
    assert_response :success
  end

end
