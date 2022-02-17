#!/bin/bash

set -e

if [ -f tmp/pids/server.pid ]; then
    rm tmp/pids/server.pid
fi

export BUNDLE_GEMFILE=/opt/workbook/Gemfile

bundle install
bundle exec rails db:environment:set RAILS_ENV=test
bundle exec rails db:drop db:create db:migrate
bundle exec guard --force-polling
