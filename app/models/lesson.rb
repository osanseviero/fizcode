class Lesson < ActiveRecord::Base
  belongs_to :course
  validates :name, presence: true,
                    length: { minimum: 5, maximum: 30 }
  validates :content, presence: true

  def next
    course.lessons.where("id > ?", id).first
  end

  def prev
    course.lessons.where("id < ?", id).last
  end
end
