class SurveysController < ApplicationController
    def show
        survey = Survey.find(params[:id])
        render json: SurveySerializer.new(survey), except: [:created_at, :updated_at]
    end 
end
