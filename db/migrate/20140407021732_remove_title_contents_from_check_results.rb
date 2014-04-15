class RemoveTitleContentsFromCheckResults < ActiveRecord::Migration
  def change
    remove_column :check_results, :title, :string
    remove_column :check_results, :contents, :text
  end
end
