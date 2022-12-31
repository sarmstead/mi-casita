require 'test_helper'

class HomeOwnershipsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get home_ownerships_url
    assert_response :success
  end

  test 'should fetch individual home ownership record' do
    get home_ownership_url(home_ownerships(:laura_bomba))
    assert_response :success
  end

  test 'should create new home ownership record' do
    assert_difference 'HomeOwnership.count' do
      post home_ownerships_url, params: {
        home_ownership: {
          person_id: '2',
          house_id: '1'
        }
      }
    end

    new_home_ownership = HomeOwnership.find_by(person_id: '2')

    assert_redirected_to home_ownership_url(new_home_ownership.id)
  end

  test 'should update a home ownership record' do
    patch home_ownership_url(home_ownerships(:laura_bomba)), params: {
      home_ownership: {
        person_id: '1'
      }
    }
    assert_redirected_to home_ownership_url(home_ownerships(:laura_bomba))
  end

  test 'should delete a home ownership record' do
    assert_difference 'HomeOwnership.count', -1 do
      delete home_ownership_url(home_ownerships(:laura_bomba))
    end

    assert_redirected_to home_ownerships_url
  end
end
