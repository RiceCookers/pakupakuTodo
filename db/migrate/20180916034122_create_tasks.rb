class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.integer :state, null: false, default: 0
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :tasks, :user_id
  end
end
