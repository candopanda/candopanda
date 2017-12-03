class SurveySerializer < ActiveModel::Serializer
  attributes :source_code, :build_result, :build_status

  def build_status
    record.build_status
  end

  def build_result
    record.build_result
  end

  private

  def record
    object.object
  end
end
