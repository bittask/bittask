class AddUniqueIndex < ActiveRecord::Migration
  def change
    add_index :answers, [:task_id, :user_id], unique: true
  end
end
