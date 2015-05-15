class CreateUsers < ActiveRecord::Migration
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :users, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :address, index: true
      t.integer :balance, default: 0
      t.timestamps null: false
    end
  end
end
