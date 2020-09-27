class QuestionsController < ApplicationController
    def index
        answers = Question.all
        if params[:survey]
            answers = Question.all.filter{|ans| ans.survey_id.to_s == params[:survey]}
        end
        render json: answers
    end
end
