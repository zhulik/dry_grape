# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      column :id, :uuid, null: false, default: Sequel.function(:uuid_generate_v4)
      primary_key [:id]
      column :username, String, null: false
      column :password_hash, String, null: false

      column :created_at, :timestamp, null: false, default: Sequel.lit("(now() at time zone 'utc')")
      column :updated_at, :timestamp, null: false, default: Sequel.lit("(now() at time zone 'utc')")

      index :username, unique: true
    end
  end
end
