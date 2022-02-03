#!/bin/bash

set -e

if [ -f tmp/pids/server.pid ]; then
    rm tmp/pids/server.pid
fi

bundle exec rails db:environment:set RAILS_ENV=test
bundle exec next rails db:create db:migrate
bundle exec next rails s -b 0.0.0.0
