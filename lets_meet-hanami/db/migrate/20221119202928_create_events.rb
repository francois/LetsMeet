# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :events do
      primary_key :id, type: :bigint
      column :public_id, :uuid, null: false, unique: true
      column :slug, :text, null: false, unique: true
      column :name, :text, null: false
      column :start_on, :date, null: false, index: true
      column :end_on, :date, null: false
    end
  end
end
