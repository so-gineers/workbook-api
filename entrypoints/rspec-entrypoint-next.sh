#!/bin/bash

set -e

if [ -f tmp/pids/server.pid ]; then
    rm tmp/pids/server.pid
fi

bundle exec rails db:create db:migrate
bundle exec guard --force-polling
