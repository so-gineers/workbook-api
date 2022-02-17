# frozen_string_literal: true

FactoryBot.define do
  factory :db_student, class: 'Db::Student' do
    login { FFaker::InternetSE.login_user_name }
    first_name { FFaker::NameSN.first_name_male }
    last_name { FFaker::NameSN.name_sn }
    password { 'workbook' }
    password_confirmation { 'workbook' }
    country_iso_code { %w(sn ml tg bf ci).shuffle.sample }
    trait :with_too_lengthy_login do
      login { 'login' * 10 }
    end
  end
end