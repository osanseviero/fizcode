class RemoveAttachmentFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :attachment, :string
  end
end
