class SurveyWithResults < SimpleDelegator
  attr_accessor :results

  def initialize(survey, results = nil)
    @results = results
    super(survey)
  end

  def build_status
    results&.success
  end

  alias success? build_status

  def build_result
    results&.result
  end
end
