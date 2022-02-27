# frozen_string_literal: true

module Db
  # Databse table for teachers
  class Teacher < ApplicationRecord
    has_secure_password

    NextRailsVersionHelper.rails_7! do
      encrypts :email, deterministic: true
      encrypts :first_name
      encrypts :last_name
      encrypts :telephone
    end
  end
end
