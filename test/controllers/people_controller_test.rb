require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get people_url
    assert_response :success
  end
end
