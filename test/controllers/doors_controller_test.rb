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

  test 'should create a new door' do
    assert_difference 'Door.count' do
      post doors_url, params: {
        door: {
          house_id: houses(:bomba).id
        }
      }
    end

    assert_redirected_to house_path(houses(:bomba))
  end

  test 'should edit a door' do
    patch door_url(doors(:front)), params: {
      door: {
        house_id: houses(:shire).id
      }
    }

    assert_redirected_to house_path(houses(:shire))
  end
end
