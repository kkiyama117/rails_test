# frozen_string_literal: true

class CreateAuthentications < ActiveRecord::Migration[5.2]
  def change
    create_table :authentications do |t|
      t.references :user, foreign_key: true, null: false
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :token, null: false

      t.timestamps
    end

    add_index :authentications, %i[provider uid], unique: true
  end
end
