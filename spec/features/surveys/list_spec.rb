require "rails_helper"

RSpec.feature "Surveys list" do
  let!(:surveys) { create_list(:survey, 2) }

  before do
    visit root_path
  end

  scenario "view the list of available surveys" do
    surveys.each do |survey|
      expect(page).to have_link("Show", href: survey_path(survey))
    end
  end
end
