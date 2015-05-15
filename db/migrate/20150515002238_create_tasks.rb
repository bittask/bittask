class CreateTasks < ActiveRecord::Migration
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :tasks, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :title
      t.integer :type
      t.text :choices, array: true
      t.integer :cost
      t.string :address
      t.integer :balance
      t.timestamps null: false
      t.references :user, type: :uuid, index: true
    end
  end
end
