require 'rails_helper'

RSpec.describe LineItemDate, type: :model do
  fixtures :all
  describe "Running LineItemDate it's " do
    it "#previous_date returns the quote's previous date when it exists" do
      assert_equal line_item_dates(:today), line_item_dates(:next_week).previous_date
    end

    it '#previous_date returns nil when the quote has no previous date' do
      assert_nil line_item_dates(:today).previous_date
    end
  end
end
