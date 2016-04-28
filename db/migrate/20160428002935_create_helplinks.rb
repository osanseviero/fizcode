class CreateHelplinks < ActiveRecord::Migration
  def change
    create_table :helplinks do |t|
      t.string :link
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
