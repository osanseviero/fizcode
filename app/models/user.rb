class User < ActiveRecord::Base
	before_save {self.mail.downcase!}

	validates :name, presence: {message: :no_name}, length:{minimum: 7, maximum:15, message: :bad_name_length}, uniqueness: {message: :name_taken}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :mail, presence: {message: :no_email} , format: { with: VALID_EMAIL_REGEX, message: :bad_email }, uniqueness:{case_sensitive:false, message: :email_taken}

	validates :password, presence: {message: :no_password}, length:{minimum:6, message: :bad_pass_length}
	
	has_secure_password

	validates_confirmation_of :password, message: :bad_pass_correspondance

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
	end

end