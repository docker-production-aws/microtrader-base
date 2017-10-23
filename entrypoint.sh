#!/bin/bash
set -e

# Add initialisation logic here
confd -onetime -backend env

# Run application
exec "$@"