class CreateUsers < ActiveRecord::Migration
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :users, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :address
      t.integer :balance
      t.timestamps null: false
    end
  end
end
