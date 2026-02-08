#!/bin/sh
# docker/scheduler/start.sh

# Start cron daemon
crond -f -d 8 &

# Keep container alive and show logs
tail -f /var/log/cron.log
