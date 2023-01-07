require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get people_url
    assert_response :success
  end

  test 'should fetch individual person' do
    get person_url(people(:laura))
    assert_response :success
  end

  test 'should create new person' do
    assert_difference 'Person.count' do
      post people_url, params: {
        person: {
          first_name: 'Nigel',
          last_name: 'Hipopotamo',
          username: '@king_sahara'
        }
      }
    end

    assert_redirected_to person_url(Person.last)
  end

  test 'should update a person' do
    patch person_url(people(:laura)), params: {
      person: {
        username: '@cool_kat_laurita'
      }
    }
    assert_redirected_to person_path(people(:laura))
  end

  test 'should delete a person' do
    assert_difference 'Person.count', -1 do
      delete person_url(people(:laura))
    end

    assert_redirected_to people_url
  end
end
