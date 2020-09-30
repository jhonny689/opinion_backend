class User < ApplicationRecord
    has_many :surveys
    has_many :responses
    has_many :respondedSurveys, through: :responses, source: :surveys

    def full_name
        "#{self.last_name}, #{self.first_name}"
    end
end
