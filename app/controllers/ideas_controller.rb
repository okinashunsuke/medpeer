class IdeasController < ApplicationController
  def index
    @category_name = request.query_parameters
    if request.query_parameters.any? && Category.joins(:ideas).exists?(name: @category_name.values)
      @ideas = Category.joins(:ideas).where(name: @category_name.values).select('ideas.id', 'name AS category','body').order('ideas.id')
      render json: { data: @ideas }
    elsif false == request.query_parameters.any?
      @ideas = Category.joins(:ideas).select('ideas.id', 'name AS category', 'body').order('ideas.id')
      render json: { data: @ideas }
    else
      render status: 404, json: { status: 404 }
    end
  end

  def new
    @idea_category = IdeaCategory.new
  end

  def create
    @idea_category = IdeaCategory.new(idea_categry_params)
    if @idea_category.valid? && Category.exists?(name: @idea_category.name)
      @idea = Idea.new(idea_params)
      @idea.save
      render status: 201, json: { status: 201 }
    elsif @idea_category.valid? && false == Category.exists?(name: @idea_category.name)
      @idea_category.save
      render status: 201, json: { status: 201 }
    else
      render status: 422, json: { status: 422 }
    end
  end

  private

  def idea_categry_params
    params.require(:idea_category).permit(:name, :body)
  end

  def idea_params
    @category = Category.joins(:ideas).where(name: @idea_category.name).first
    params.require(:idea_category).permit(:body).merge(category_id: @category.id)
  end
end
