class Course < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    validates :attachment, presence: true
   	validates :description, presence: true

   	has_many :lessons
  	validates :name, presence: true,
                    length: { minimum: 5, maximum: 20 }

   	has_many :temas
   	has_many :sources
   	has_many :helplinks
end
