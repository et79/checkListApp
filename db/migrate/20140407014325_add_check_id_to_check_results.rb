class AddCheckIdToCheckResults < ActiveRecord::Migration
  def change
    add_column :check_results, :check_id, :integer
  end
end
