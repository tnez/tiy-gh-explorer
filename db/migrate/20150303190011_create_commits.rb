class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.integer :event_id
      t.string :sha
      t.text :message
      t.text :url
      t.timestamp :commit_timestamp
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
