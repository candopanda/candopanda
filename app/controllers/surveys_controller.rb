class SurveysController < ApplicationController
  before_action :fetch_survey, only: %i(show update)

  def index
    @surveys = Survey.all.order(created_at: :desc)
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: SurveySerializer.new(@survey) }
    end
  end

  def create
    survey = Survey.create!
    redirect_to survey_path(survey)
  end

  def update
    Survey.transaction do
      @survey.results = CODE_RUNNER.execute(survey_params[:source_code])
      @survey.update_attributes!(survey_params)
    end

    render json: SurveySerializer.new(@survey)
  end

  private

  def fetch_survey
    @survey = SurveyWithResults.new(Survey.find(params[:id]))
  end

  def survey_params
    params.require(:survey).permit(:source_code).tap do |p|
      p[:completed_at] = Time.zone.now if @survey&.success?
    end
  end
end
