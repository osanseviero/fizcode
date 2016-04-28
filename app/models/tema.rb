class Tema < ActiveRecord::Base
	belongs_to :course

	# validates :name, presence: true,
 #                    length: { minimum: 5, maximum: 40 }
end
