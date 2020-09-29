class User < ApplicationRecord
    has_many :surveys
    has_many :responses

    def full_name
        "#{self.last_name}, #{self.first_name}"
    end

    def published_surveys
        self.surveys.filter { |survey| survey.status == "published"}
    end 

    def survey_drafts
        self.surveys.filter { |survey| survey.status == "draft"}
    end 

    def closed_surveys
        self.surveys.filter { |survey| survey.status == "closed"}
    end 
end
