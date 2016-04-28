class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :link
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
