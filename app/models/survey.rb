class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :survey_category
  has_many :questions
end
