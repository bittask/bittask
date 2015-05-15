class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      add_reference :tasks, :user, index: true, foreign_key: true
      t.string :title
      t.integer :type
      t.text :choices, array: true
      t.integer :cost
      t.string :address
      t.integer :balance_total
      t.integer :balance


      t.timestamps null: false
    end
  end
end
