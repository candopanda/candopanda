require "rails_helper"

RSpec.feature "Start a new survey" do
  before do
    visit root_path
  end

  scenario "click on the new survey link" do
    click_on "New Survey"

    expect(page).to have_current_path(%r{/surveys/*+})
  end
end
