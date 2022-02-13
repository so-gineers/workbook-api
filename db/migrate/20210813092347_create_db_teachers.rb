# frozen_string_literal: true

class CreateDbTeachers < ActiveRecord::Migration[6.1]
  def change
    create_enum :person_title, %w[mr mme]
    create_enum :teacher_status, %w[pending active banned locked]

    create_table :db_teachers, id: :uuid do |t|
      t.enum :status, as: :teacher_status, default: 'pending'
      t.enum :person_title, as: :person_title, null: false
      t.datetime :banned_at
      t.string :email, null: false, unique: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.datetime :locked_at
      t.string :phone_number, unique: true, null: false
      t.string :bio
      t.string :password_digest

      t.timestamps
    end
  end
end
