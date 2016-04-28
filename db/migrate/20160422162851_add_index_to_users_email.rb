class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :mail, unique: true
  end
end
