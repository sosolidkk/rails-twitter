# frozen_string_literal: true

class AddIdentityToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :string

    add_index :users, :username, unique: true
  end
end
