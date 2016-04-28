class AddContentLessons < ActiveRecord::Migration
  def change
  	 add_column :lessons, :content, :string
  end
end
