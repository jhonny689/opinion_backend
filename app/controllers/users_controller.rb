class UsersController < ApplicationController
    def index
        if params[:admin] && params[:admin] == "true"
            users = User.all.filter {|user| user.role == "admin"}
        else
            users = User.all
        end
        render json: UserSerializer.new(users), except: [:created_at, :updated_at]
    end

    def show 
        user = User.find(params[:id])
        if params[:surveys] && params[:surveys] == "published"
            render json: user, include: [:published_surveys]
        elsif params[:surveys] && params[:surveys] == "draft"
            render json: user, include: [:survey_drafts]
        elsif params[:surveys] && params[:surveys] == "closed"
            render json: user, include: [:closed_surveys]
        else  
            render json: user, include: [:surveys]
        end 
    end 
end
