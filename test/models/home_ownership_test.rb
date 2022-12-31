require 'test_helper'

class HomeOwnershipTest < ActiveSupport::TestCase
  test 'should not save with invalid or empty person_id' do
    home_ownership = HomeOwnership.new(person_id: 'invalid_id', house_id: houses(:bomba).id)
    assert_not home_ownership.save

    home_ownership_two = HomeOwnership.new(person_id: '', house_id: houses(:bomba).id)
    assert_not home_ownership_two.save
  end

  test 'should not save with invalid or empty house_id' do
    home_ownership = HomeOwnership.new(person_id: people(:laura).id, house_id: 'invalid_id')
    assert_not home_ownership.save

    home_ownership_two = HomeOwnership.new(person_id: people(:laura).id, house_id: '')
    assert_not home_ownership_two.save
  end

  test 'should delete associated ownership records when person is deleted' do
    Person.destroy(people(:laura).id)
    assert_raises(ActiveRecord::RecordNotFound) do
      HomeOwnership.find_by(id: home_ownerships(:laura_bomba).id)
    end
  end

  test 'should delete associated ownership records when house is deleted' do
    House.destroy(houses(:bomba).id)
    assert_raises(ActiveRecord::RecordNotFound) do
      HomeOwnership.find_by(id: home_ownerships(:laura_bomba).id)
    end
  end

  test 'should delete record with valid person_id and house_id' do
    assert HomeOwnership.destroy(home_ownerships(:laura_bomba).id)
  end
end
