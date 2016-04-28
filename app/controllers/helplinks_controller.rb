class HelplinksController < ApplicationController
  before_action :logged_in_user, only:[:new, :edit, :update, :create, :destroy] #aqui deberian ir las acciones que puede realizar sin sign-in ]
  before_action :admin_user, only:[:new, :edit, :update, :create, :destroy]

  def index
    @helplinks = Helplinks.all
  end

  def new
    @helplink = Helplink.new
    @course = Course.find(params[:course_id])   
  end

  def create
    @course = Course.find(params[:course_id])
    @helplink = @course.helplinks.create(helplinks_params)

    if @helplink.save
        redirect_to course_path(@course)
    else
        render 'new'
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @helplink = @course.helplinks.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @helplink = @course.helplinks.find(params[:id])
    if @helplink.update_attributes(helplink_params)
      redirect_to course_path(@course)
    else
    render action: "edit"
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @helplink = @course.helplinks.find(params[:id])
    @helplink.destroy
  end

private
    def helplinks_params
      params.require(:helplink).permit(:id, :title, :link, course_attributes: [:id])
    end
end