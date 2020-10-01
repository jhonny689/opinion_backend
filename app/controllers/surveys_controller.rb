class SurveysController < ApplicationController
    def show
        survey = Survey.find(params[:id])
        render json: SurveySerializer.new(survey), except: [:created_at, :updated_at]
    end 

    def index
        surveys = Survey.all
        
        if params[:status]
            surveys = surveys.filter{|survey| survey.status == params[:status]}
        end
        if params[:user]
            surveys = surveys.filter{|survey| !survey.surveyees.uniq.include?(User.find(params[:user]))}
        end
        render json: SurveySerializer.new(surveys), except: [:questions, :created_at, :updated_at]

    end

    def create
        params.permit!
        byebug
        survey = Survey.create({title: params[:title], status: params[:status], due_date: params[:due_date], user_id: params[:user_id], description: params[:description], survey_category_id: params[:survey_category_id]})
        params[:questions].each do |question|
            question[:survey_id] = survey.id
            byebug
            Question.create(question)
        end
    end
end
