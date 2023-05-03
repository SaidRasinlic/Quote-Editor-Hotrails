require 'rails_helper'

describe 'quotes/index', type: :feature do
  fixtures :all
  before :each do
    login_as users(:accountant)
    @quote = Quote.ordered.first
  end

  context 'upon manipulating a new quote we' do
    it 'should be able to see a quote' do
      visit quotes_path
      click_link @quote.name

      assert_selector 'h1', text: @quote.name
    end

    it 'should be able to create a new quote' do
      visit quotes_path
      assert_selector 'h1', text: 'Quotes'

      click_on 'New quote'
      fill_in 'Name', with: 'Capybara quote'
      click_on 'Create quote'

      assert_selector 'h1', text: 'Quotes'
      assert_text 'Capybara quote'
    end
  end

  context 'upon clicking or manipulating a quote it' do
    it "should land us on a quotes page with being able to see a quote's name" do
      visit quotes_path
      click_link @quote.name
      assert_selector 'h1', text: @quote.name
    end

    it 'updates a quote' do
      visit quotes_path
      assert_selector 'h1', text: 'Quotes'

      click_on 'Edit', match: :first
      fill_in 'Name', with: 'Updated quote'
      # expect(page).to have_css("h1", text: "Quotes", wait: 5)
      # expect(page.have_field(id: "quotes")).to have_text("Quotes")
      # have_field(id: 'email', placeholder: 'Email')

      assert_selector 'h1', text: 'Quotes'
      click_on 'Update quote'

      assert_selector 'h1', text: 'Quotes'
      assert_text 'Updated quote'

      # within_frame("quotes") do
      #   page.should have_content "Quotes"
      # end
      # assert_selector "h1", text: "Quotes", visible: false
    end

    it 'destroys a quote' do
      visit quotes_path
      assert_text @quote.name

      click_on 'Delete', match: :first
      assert_no_text @quote.name
    end
  end
end
