class SurveySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :status, :due_date, :description, :surveyor, :survey_category_id, :questions
end
