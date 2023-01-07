require 'test_helper'

class WindowsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get windows_url
    assert_response :success
  end

  test 'should fetch individual window' do
    get window_url(windows(:front))
    assert_response :success
  end
end
