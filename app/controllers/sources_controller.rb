class SourcesController < ApplicationController
  before_action :logged_in_user, only:[:new, :edit, :update, :create, :destroy] #aqui deberian ir las acciones que puede realizar sin sign-in ]
  before_action :admin_user, only:[:new, :edit, :update, :create, :destroy]

  def index
    @sources = Sources.all
  end

  def new
    @source = Source.new
    @course = Course.find(params[:course_id])   
  end

  def create
    @course = Course.find(params[:course_id])
    @source = @course.sources.create(sources_params)

    if @source.save
        redirect_to course_path(@course)
    else
        render 'new'
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @source = @course.sources.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @source = @course.sources.find(params[:id])
    if @source.update_attributes(source_params)
      redirect_to course_path(@course)
    else
    render action: "edit"
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @source = @course.sources.find(params[:id])
    @source.destroy
  end

private
    def sources_params
      params.require(:source).permit(:id, :title, :link, course_attributes: [:id])
    end
end