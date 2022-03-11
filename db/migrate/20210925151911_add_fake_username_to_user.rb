# frozen_string_literal: true

class AddFakeUsernameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fake_username, :string
  end
end
