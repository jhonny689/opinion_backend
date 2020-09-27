class UsersController < ApplicationController
    def index
        if params[:admin] && params[:admin] == "true"
            users = User.all.filter {|user| user.role == "admin"}
        else
            users = User.all
        end
        render json: UserSerializer.new(users), except: [:created_at, :updated_at]
    end
end
