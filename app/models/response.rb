class Response < ApplicationRecord
  belongs_to :user
  belongs_to :question
  
  def survey
    self.question.survey
  end

  def question_text
    self.question.question_text
  end

  def question_type
    self.question.question_type_id
  end
end
