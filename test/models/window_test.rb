require 'test_helper'

class WindowTest < ActiveSupport::TestCase
  test 'should save with valid associated house' do
    window = Window.new(house_id: houses(:bomba).id)
    assert window.save
  end

  test 'should delete record with valid window' do
    assert Window.destroy(windows(:front).id)
  end
end
