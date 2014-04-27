class AddUserToChecks < ActiveRecord::Migration
  def change
    add_reference :checks, :user, index: true
  end
end
