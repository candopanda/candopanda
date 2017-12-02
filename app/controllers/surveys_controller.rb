class SurveysController < ApplicationController
  def show
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])

    Survey.transaction do
      @compile_result = CODE_RUNNER.execute(survey_params[:source_code])
      @survey.update_attributes!(survey_params)
    end

    render "show"
  end

  private

  def survey_params
    params.require(:survey).permit(:source_code).tap do |p|
      p[:completed_at] = Time.zone.now if @compile_result&.success
    end
  end
end
