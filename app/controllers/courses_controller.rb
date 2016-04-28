class CoursesController < ApplicationController
    before_action :logged_in_user, only:[:new, :edit, :update, :create, :destroy]#aqui deberian ir las acciones que puede realizar sin sign-in ]
    before_action :admin_user, only:[:new, :edit, :update, :create, :destroy]
  def index
  	@courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @temas = Tema.all
    @helplinks = Helplink.all
    @sources = Source.all
  end

  def new
  	@course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

   def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:warning] = "Se ha modificado el curso #{@course.name}"
      redirect_to courses_path
    else
      render action: "edit"
    end
  end

  def create
  	@course = Course.new(course_params)

  	if @course.save
        flash[:success] = "Se ha creado el curso #{@course.name}"
  		  redirect_to @course 
  	else
  		render 'new'
  	end
  end

  def destroy
  	@course = Course.find(params[:id])
  	@course.destroy
    flash[:warning] = "Se ha destruido el curso #{@course.name}"
  	redirect_to courses_path
  end

  private
  	def course_params
  		params.require(:course).permit(:name, :attachment, :description)
  	end
end


def admin_user
  unless current_user.admin?
    flash[:danger] = "Sólo admins"
    redirect_to (root_url)
  end
end

def logged_in_user
  unless logged_in?
    flash[:warning] = "Por favor ingrese su cuenta"
    redirect_to courses_path
  end
end


