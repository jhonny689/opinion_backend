class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :survey_category
  has_many :questions

  def due_date_formatted
    self.due_date.strftime("%Y/%m/%d")
  end 

  def surveyor
    self.user.full_name
  end
end
