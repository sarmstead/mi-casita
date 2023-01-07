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

  test 'should create new window' do
    assert_difference 'Window.count' do
      post windows_url, params: {
        window: {
          house_id: houses(:bomba).id
        }
      }
    end

    # Window.count in the test db is determined by test/fixtures/windows.yml
    new_window = Window.find('2')

    assert_redirected_to house_path(new_window.house)
  end
end
