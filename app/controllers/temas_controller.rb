class TemasController < ApplicationController
  before_action :logged_in_user, only:[:new, :edit, :update, :create, :destroy] #aqui deberian ir las acciones que puede realizar sin sign-in ]
  before_action :admin_user, only:[:new, :edit, :update, :create, :destroy]

  def index
    @temas = Temas.all
  end

  def new
    @tema = Tema.new
    @course = Course.find(params[:course_id])   
  end

  def create
    @course = Course.find(params[:course_id])
    @tema = @course.temas.create(temas_params)

    if @tema.save
        redirect_to course_path(@course)
    else
        render 'new'
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @tema = @course.temas.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @tema = @course.temas.find(params[:id])
    if @tema.update_attributes(tema_params)
      redirect_to course_path(@course)
    else
    render action: "edit"
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @tema = @course.temas.find(params[:id])
    @tema.destroy
  end

private
    def temas_params
      params.require(:tema).permit(:id, :name, course_attributes: [:id])
    end
end