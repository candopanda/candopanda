require "rails_helper"

RSpec.feature "Submit a survey", js: true do
  let(:survey) { create(:survey) }

  before do
    visit survey_path(survey)
  end

  scenario "with a valid code and see success message" do
    find(".survey-form-wrap textarea").set(open_fixture("hello_world.c").read)
    click_on "Run"

    within(".survey-form-output.success") do
      expect(page).to have_content("Hello, World!")
    end
  end

  scenario "with an error and see compilation error" do
    find(".survey-form-wrap textarea").set(open_fixture("broken.c").read)
    click_on "Run"

    expect(page).to have_selector(".survey-form-output.failure")
  end
end
