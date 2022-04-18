# frozen_string_literal: true

module Db
  # Stores data about students
  class Student < ApplicationRecord
    has_secure_password
  end
end

# == Schema Information
#
# Table name: db_eleves
#
#  id              :uuid             not null, primary key
#  code_iso        :string(3)
#  email           :string
#  login           :string(40)       not null
#  last_name             :string           not null
#  password_digest :string           not null
#  telephone       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_db_eleves_on_code_iso   (code_iso)
#  index_db_eleves_on_email      (email) UNIQUE WHERE (email IS NOT NULL)
#  index_db_eleves_on_login      (login) UNIQUE
#  index_db_eleves_on_telephone  (telephone) UNIQUE WHERE (telephone IS NOT NULL)
#
