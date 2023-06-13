class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string      :title,      null: false
      t.text        :content,    null: false
      t.integer     :mobile_id,  null: false
      t.datetime    :start_time, null: false
      t.references  :user,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
