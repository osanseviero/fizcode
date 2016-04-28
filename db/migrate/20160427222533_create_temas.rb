class CreateTemas < ActiveRecord::Migration
  def change
    create_table :temas do |t|
      t.string :name

      t.references :course, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
