require 'test_helper'

class HousesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get houses_url
    assert_response :success
  end

  test 'should fetch individual house' do
    get house_url(houses(:bomba))
    assert_response :success
  end

  test 'should create new house' do
    assert_difference 'House.count' do
      post houses_url, params: {
        house: {
          name: 'Deathly Hallows',
          exterior_color: '#ffffff',
          trim_color: '#ffffff'
        }
      }
    end

    assert_redirected_to new_home_ownership_path(house_id: House.last.id)
  end

  test 'should update a house' do
    patch house_url(houses(:bomba)), params: {
      house: {
        exterior_color: '#f2f2f2'
      }
    }
    assert_redirected_to house_url
  end

  test 'should delete a house' do
    assert_difference 'House.count', -1 do
      delete house_url(houses(:bomba))
    end

    assert_redirected_to houses_url
  end
end
