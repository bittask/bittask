class CreateAnswers < ActiveRecord::Migration
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :answers, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :task, type: :uuid, index: true
      t.references :user, type: :uuid, index: true
      t.integer :choice
      t.string :text
      t.timestamps null: false
    end
  end
end
