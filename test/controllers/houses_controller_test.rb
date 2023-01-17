require 'test_helper'

class HousesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in(people(:laura))
  end

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

    assert_redirected_to houses_path
  end

  test 'should update a house' do
    patch house_url(houses(:bomba)), params: {
      house: {
        exterior_color: '#f2f2f2'
      }
    }
    assert_redirected_to house_path
  end

  test 'should delete a house' do
    assert_difference 'House.count', -1 do
      delete house_url(houses(:bomba))
    end

    assert_redirected_to houses_url
  end
end
