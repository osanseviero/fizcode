class LessonsController < ApplicationController
    before_action :logged_in_user, only:[:new, :edit, :update, :create, :destroy, :show]#aqui deberian ir las acciones que puede realizar sin sign-in ]
    before_action :admin_user, only:[:new, :edit, :update, :create, :destroy]
	def new
    	@lesson = Lesson.new
    	@course = Course.find(params[:course_id])	
    end

	def create
   		@course = Course.find(params[:course_id])
    	@lesson = @course.lessons.create(lesson_params)

      if @lesson.save
        flash[:success] = "Se ha creado la leccion #{@lesson.name}"
        redirect_to course_path(@course)
      else
        render 'new'
      end
    end

    def edit
      @course = Course.find(params[:course_id])
      @lesson = @course.lessons.find(params[:id])
    end

    def update
      @course = Course.find(params[:course_id])
      @lesson = @course.lessons.find(params[:id])
      if @lesson.update_attributes(lesson_params)
        flash[:warning] = "Se ha modificado la leccion #{@lesson.name}"
        redirect_to course_path(@course)
      else
      render action: "edit"
    end

    end

    def show
    	@course = Course.find(params[:course_id])
	    @lesson = @course.lessons.find(params[:id])
	  end

    def destroy
      @course = Course.find(params[:course_id])
      @lesson = @course.lessons.find(params[:id])
      @lesson.destroy
      flash[:warning] = "Se ha destruido la leccion"
      redirect_to course_path(@course)
    end

def admin_user
  @course = Course.find(params[:course_id])
  unless current_user.admin?
    flash[:danger] = "Solo admins"
    redirect_to course_path(@course)
  end 
end

def logged_in_user
  unless logged_in?
    flash[:warning] = "Por favor ingrese su cuenta"
    redirect_to courses_path
  end
end
 
  private
    def lesson_params
      params.require(:lesson).permit(:id, :name, :content, course_attributes: [:id])
    end
end