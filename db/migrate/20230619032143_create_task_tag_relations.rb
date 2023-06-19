class CreateTaskTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :task_tag_relations do |t|
      t.references :task, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
