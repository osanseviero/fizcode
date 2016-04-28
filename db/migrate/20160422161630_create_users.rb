class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.boolean :admin
      change_column :users, :admin, :boolean, :default => false

      t.timestamps null: false
    end
  end
end
