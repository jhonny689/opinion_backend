class QuestionsController < ApplicationController
    def index
        questions = Question.all
        if params[:survey]
            questions = Question.all.filter{|ans| ans.survey_id.to_s == params[:survey]}
        end
        render json: questions
    end
end
