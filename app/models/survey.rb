class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :survey_category
  has_many :questions
  has_many :responses, through: :questions

  has_many :surveyees, through: :responses, source: :user

  def due_date_formatted
    self.due_date.strftime("%Y/%m/%d")
  end 

  def surveyor
    self.user.full_name
  end
end
