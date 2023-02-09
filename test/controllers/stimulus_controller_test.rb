require "test_helper"

class StimulusControllerTest < ActionDispatch::IntegrationTest
  test "should get search_station" do
    get stimulus_search_station_url
    assert_response :success
  end
end
