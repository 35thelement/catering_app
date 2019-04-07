#!/bin/bash

export MIX_ENV=prod
export PORT=4796

echo "Stopping old copy of app, if any..."
_build/prod/rel/catering_app/bin/catering_app stop || true

echo "Starting app..."
_build/prod/rel/catering_app/bin/catering_app foreground

