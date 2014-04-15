class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :title
      t.text :contents

      t.timestamps
    end
  end
end
