class AuthenticationsController < ApplicationController
  def create
    authentication = Authentication.where(username: params[:username], password: params[:password])
    render json: authentication, except: [:password], include: [:user]
  end
end
