class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :question
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.string :answer4
      t.string :truequest

      t.timestamps
    end
  end
end
