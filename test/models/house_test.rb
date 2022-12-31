require 'test_helper'

class HouseTest < ActiveSupport::TestCase
  test 'should not save without name' do
    house = House.new(name: '', exterior_color: '#ffffff', trim_color: '#ffffff')
    assert_not house.save
  end

  test 'should not save without exterior color' do
    house = House.new(name: 'La Casa', exterior_color: '', trim_color: '#ffffff')
    assert_not house.save
  end

  test 'should not save without trim color' do
    house = House.new(name: 'La Casa', exterior_color: '#ffffff', trim_color: '')
    assert_not house.save
  end

  test "colors must contain'#' symbol" do
    house = House.new(name: 'La Casa', exterior_color: 'ffffff', trim_color: '#ffffff')
    assert_not house.save

    house_two = House.new(name: 'La Casita', exterior_color: '#ffffff', trim_color: 'ffffff')
    assert_not house_two.save
  end

  test 'should delete record with valid house' do
    assert House.destroy(houses(:bomba).id)
  end
end
