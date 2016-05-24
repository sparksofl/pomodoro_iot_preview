class CreatePomodoros < ActiveRecord::Migration[5.1]
  def change
    create_table :pomodoros do |t|
      t.decimal :duration
      t.integer :task_id

      t.timestamps
    end
  end
end
