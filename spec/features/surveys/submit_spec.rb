require "rails_helper"

RSpec.feature "Submit a survey" do
  let(:survey) { create(:survey) }

  before do
    visit survey_path(survey)
  end

  scenario "with a valid code and see success message" do
    fill_in "Source code", with: open_fixture("hello_world.c").read
    click_on "Submit"

    within(".survey-compilation-result.success") do
      expect(page).to have_content("Hello, World!")
    end
  end

  scenario "with an error and see compilation error" do
    fill_in "Source code", with: open_fixture("broken.c").read
    click_on "Submit"

    expect(page).to have_selector(".survey-compilation-result.failure")
  end
end
