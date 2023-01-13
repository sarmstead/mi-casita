require 'test_helper'

class DoorTest < ActiveSupport::TestCase
  test 'should save with valid associated house' do
    door = Door.new(house: houses(:bomba))
    assert door.save
  end

  test 'should delete record with valid door' do
    assert Door.destroy(doors(:front).id)
  end
end
