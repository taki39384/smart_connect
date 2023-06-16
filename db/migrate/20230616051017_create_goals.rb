class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string      :goal_name,   null: false
      t.integer     :goal_number,   null: false
      t.integer     :achievement_number,   null: false
      t.references  :user,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
