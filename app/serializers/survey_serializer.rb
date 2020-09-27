class SurveySerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :status, :due_date, :description, :surveyor, :survey_category_id, :questions
end
