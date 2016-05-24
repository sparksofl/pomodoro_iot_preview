class CreateTimers < ActiveRecord::Migration[5.1]
  def change
    create_table :timers do |t|
      t.integer :user_id
      t.string :token

      t.timestamps
    end
  end
end
