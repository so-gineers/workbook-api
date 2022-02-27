# frozen_string_literal: true

class CreateDbTeachers < ActiveRecord::Migration[7.0]
  def change
    create_enum :person_title, %w[mr mme]
    create_enum :teacher_status, %w[pending active banned locked]

    create_table :db_teachers, id: :uuid do |t|
      t.enum:status, enum_type: :teacher_status, default: 'pending', index: true
      t.enum :title, enum_type: :person_title, default: 'mr', null: false
      t.datetime :banned_at
      t.string :email, null: false, index: { unique: true }
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.datetime :locked_at
      t.string :phone_number, index: { unique: true }, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
