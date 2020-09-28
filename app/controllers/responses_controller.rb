class ResponsesController < ApplicationController
    def index
        responses = Response.all 
        render json: responses 
    end 

    def create

    end
end


