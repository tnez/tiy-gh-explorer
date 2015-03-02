class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :github_user
      t.string :tiy_campus
      t.string :tiy_course
      t.date :tiy_start_date

      t.timestamps null: false
    end
  end
end
