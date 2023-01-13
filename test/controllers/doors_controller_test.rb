require 'test_helper'

class DoorsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get doors_url
    assert_response :success
  end

  test 'should fetch individual door' do
    get door_url(doors(:front))
    assert_response :success
  end
end
