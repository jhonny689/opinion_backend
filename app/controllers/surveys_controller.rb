class SurveysController < ApplicationController
    def show
        survey = Survey.find(params[:id])
        render json: SurveySerializer.new(survey), except: [:created_at, :updated_at]
    end 

    def index
        surveys = Survey.all
        
        if params[:status]
            surveys = Survey.all.filter{|survey| survey.status == params[:status]}
        end
        render json: SurveySerializer.new(surveys), except: [:questions, :created_at, :updated_at]

    end
end
