class ResponseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :value, :question_id, :question_type, :question_text, :user_id

end
