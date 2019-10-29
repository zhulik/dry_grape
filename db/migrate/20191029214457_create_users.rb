# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      column :id, :uuid, null: false, default: Sequel.function(:uuid_generate_v4)
      primary_key [:id]
      column :username, String, null: false
      column :password_hash, String, null: false
    end
  end
end
