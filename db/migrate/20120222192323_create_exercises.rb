class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :person
      t.integer :minutes
      t.datetime :exercise_date

      t.timestamps
    end
  end
end
