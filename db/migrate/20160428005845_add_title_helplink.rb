class AddTitleHelplink < ActiveRecord::Migration
  def change
    add_column :helplinks, :title, :string
  end
end
