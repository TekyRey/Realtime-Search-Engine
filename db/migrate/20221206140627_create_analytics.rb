class CreateAnalytics < ActiveRecord::Migration[7.0]
  def change
    create_table :analytics do |t|
      t.string :word, null: false
      t.integer :count, null: false, default: 1

      t.timestamps
    end
  end
end
