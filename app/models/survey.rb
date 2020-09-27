class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :survey_category
  has_many :questions

  def surveyor
    self.user.full_name
  end
end
