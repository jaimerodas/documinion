class CreateUsersAndDocumentTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, limit: 512
      t.string :apple_uid, limit: 512
      t.jsonb :vars, default: {}, null: false
      t.jsonb :min_vars, default: [], null: false
      t.jsonb :settings
      t.timestamps
    end

    create_table :document_templates do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name, limit: 512, null: false
      t.text :liquid_text
      t.jsonb :user_vars, default: [], null: false
      t.jsonb :local_vars, default: [], null: false
      t.timestamps
    end
  end
end
