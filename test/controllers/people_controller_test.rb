require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test 'should register new person' do
    post person_registration_url({ person: { first_name: 'Kye', last_name: 'Frisbee', email: 'kf@email.com', username: '@kf', password: 'password' } })

    new_person = Person.find_by(username: '@kf')

    assert_redirected_to person_path(new_person)
  end
end
