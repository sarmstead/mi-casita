require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test 'should not save without first name' do
    person = Person.new(first_name: '', last_name: 'Jirafa', username: '@four_foot_beast', email: 'jirafa@email.com', password: 'password')
    assert_not person.save
  end

  test 'should not save without last name' do
    person = Person.new(first_name: 'Winklewire', last_name: '', username: '@four_foot_beast', email: 'jirafa@email.com', password: 'password')
    assert_not person.save
  end

  test 'should not save without username' do
    person = Person.new(first_name: 'Winklewire', last_name: 'Jirafa', username: '', email: 'jirafa@email.com', password: 'password')
    assert_not person.save
  end

  test "username must contain'@' symbol" do
    person = Person.new(first_name: 'Winklewire', last_name: 'Jirafa', username: 'four_foot_beast', email: 'jirafa@email.com', password: 'password')
    assert_not person.save
  end

  test 'should delete record with valid user' do
    assert Person.destroy(people(:laura).id)
  end
end
