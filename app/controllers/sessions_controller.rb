class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(mail: params[:session][:mail])
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to courses_path
  	else
      flash[:danger] = "Combinación de correo y contraseña equivocada"
   		render "/welcome/index"
    end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end
end
