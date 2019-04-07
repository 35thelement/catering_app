#!/bin/bash

export MIX_ENV=prod
export PORT=4796

echo "Stopping old copy of app"
_build/prod/rel/catering_app/bin/catering_app stop || true
