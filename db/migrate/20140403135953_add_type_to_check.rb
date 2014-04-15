class AddTypeToCheck < ActiveRecord::Migration
  def change
    add_column :checks, :type, :string
  end
end
