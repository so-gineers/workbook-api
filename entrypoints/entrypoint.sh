#!/bin/bash

set -e

if [ -f tmp/pids/server.pid ]; then
    rm tmp/pids/server.pid
fi

bundle exec rails swarm:migrate
bundle exec rails s -b 0.0.0.0
