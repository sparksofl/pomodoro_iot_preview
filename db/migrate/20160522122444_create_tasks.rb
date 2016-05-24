class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :desc
      t.boolean :finished, default: false
      t.boolean :current, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
