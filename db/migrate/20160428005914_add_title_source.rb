class AddTitleSource < ActiveRecord::Migration
  def change
    add_column :sources, :title, :string
  end
end
