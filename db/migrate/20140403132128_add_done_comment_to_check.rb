class AddDoneCommentToCheck < ActiveRecord::Migration
  def change
    add_column :checks, :done, :boolean
    add_column :checks, :comment, :text
  end
end
