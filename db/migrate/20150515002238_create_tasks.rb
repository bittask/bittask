class CreateTasks < ActiveRecord::Migration
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :tasks, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :user, type: :uuid, index: true
      t.string :title
      t.integer :task_type, default: 0
      t.text :choices, array: true
      t.integer :cost
      t.string :address, index: true
      t.integer :balance, default: 0
      t.boolean :active, default: false
      t.timestamps null: false
    end
  end
end
