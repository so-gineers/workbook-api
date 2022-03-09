# frozen_string_literal: true

module Db
  # Databse table for teachers
  class Teacher < ApplicationRecord
    has_secure_password

    validates :identifier, :email, :first_name, :last_name, :phone_number,
      presence: true
    validates :identifier, uniqueness: { case_sensitive: false }

    encrypts :email
    encrypts :first_name
    encrypts :last_name
    encrypts :phone_number
  end
end
