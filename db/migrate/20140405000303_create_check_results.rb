class CreateCheckResults < ActiveRecord::Migration
  def change
    create_table :check_results do |t|
      t.string :title
      t.text :contents
      t.boolean :done, default: false
      t.text :comment
      t.references :project, index: true

      t.timestamps
    end
  end
end
