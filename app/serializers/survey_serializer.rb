class SurveySerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :status, :due_date, :description, :user_id, :survey_category_id, :questions
end
