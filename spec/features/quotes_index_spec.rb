require "rails_helper"

describe "quotes/index", type: :feature do
  before :each do
    @quote = quotes(:first) # Reference to the first fixture quote
  end

  context "upon creating a new quote we" do
    it "should be able to see a title with text \"Quotes\" > clicking \"New quote\" renders a page with \"New quote\" title
      > filling the name input field with \"Capybara quotes\" should redirect us to home page where we'll we able to see a newly created quote" do
      visit quotes_path
      assert_selector "h1", text: "Quotes"

      click_on "New quote"
      assert_selector "h1", text: "New quote"

      fill_in "Name", with: "Capybara quote"
      click_on "Create quote"

      assert_selector "h1", text: "Quotes"
      assert_text "Capybara quote"
    end
  end

  context "upon clicking or manipulating a quote" do
    it "should land us on a quotes page with being able to see a quote's name" do
      visit quotes_path
      click_link @quote.name
      assert_selector "h1", text: @quotes.name
    end

    it "updates a quote" do
      visit quotes_path
      assert_selector "h1", text: "Quotes"

      click_on "Edit", match: :first
      assert_selector "h1", text: "Edit quote"

      fill_in "Name", with: "Updated quote"
      click_on "Update quote"

      assert_selector "h1", text: "Quotes"
      assert_text "Updated quote"
    end

    it "destroys a quote" do
      visit quotes_path
      assert_text @quote.name

      click_on "Delete", match: :first
      assert_no_text @quote.name
    end
  end
end
