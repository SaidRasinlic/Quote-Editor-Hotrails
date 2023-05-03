require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :all
  it 'name' do
    assert_equal 'Accountant', users(:accountant).name
  end
end
