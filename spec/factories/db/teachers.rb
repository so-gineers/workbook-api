# frozen_string_literal: true

FactoryBot.define do
  factory :db_teacher, class: 'Db::Teacher' do
    person_title { 'mr'}
    last_name { FFaker::NameSN.last_name }
    first_name { FFaker::NameSN.first_name_male }
    email { FFaker::Internet.email }
    phone_number { FFaker::PhoneNumberSN.mobile_number }
    banned_at { }
    password { 'workbook' }

    trait :active do
      status { 'active' }
    end

    trait :locked do
      status { 'locked' }
      locked_at { Time.current }
    end

    trait :banned do
      status { 'banned' }
      banned_at { Time.current }
    end
  end
end

# == Schema Information
#
# Table name: db_teachers
#
#  id              :uuid             not null, primary key
#  actif           :boolean          default(TRUE)
#  banni           :boolean          default(FALSE)
#  banni_le        :datetime
#  email           :string
#  gender          :string           default("Mr")
#  last_name             :string           not null
#  password_digest :string
#  prelast_name          :string           not null
#  telephone       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  db_matiere_id   :uuid             not null
#
# Indexes
#
#  index_db_teachers_on_db_matiere_id  (db_matiere_id)
#  index_db_teachers_on_email          (email) UNIQUE
#  index_db_teachers_on_telephone      (telephone) UNIQUE
#
