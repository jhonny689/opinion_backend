class Question < ApplicationRecord
  belongs_to :survey
  belongs_to :question_type
  has_many :responses
end
