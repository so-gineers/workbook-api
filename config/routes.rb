# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :teachers, only: %i[index show]
  end

  namespace :teachers do
    resources :sessions, only: [:create]
    resources :dashboards, only: [:index]
    namespace :submissions do
      resources :french_essays, only: %i[create index]
    end
    namespace :topics do
      resources :french_essays, only: %i[create index]
    end
  end

  namespace :students do
    resources :sessions, only: [:create]
    resources :accounts, only: %i[create update]
    namespace :submissions do
      resources :french_essays, only: [:create]
    end
    namespace :topics do
      resources :french_essays, only: [:create]
    end
  end
end
