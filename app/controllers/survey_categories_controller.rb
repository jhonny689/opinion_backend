class SurveyCategoriesController < ApplicationController
  def index
    categories = SurveyCategory.all
    render json: categories
  end
end
