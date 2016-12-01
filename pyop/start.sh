#!/bin/sh
# This start-script differs from the one in the pyop
# repo in the sense that it doesn't use https since
# nginx terminates TLS and the version of nginx that
# is currently used doesn't support upstreams with
# self-signed certificates.

set -e
set -x

. /opt/pyop/bin/activate

# nice to have in docker run output, to check what
# version of something is actually running.
/opt/pyop/bin/pip freeze

export PYTHONPATH=/opt/pyop/src

start-stop-daemon --start \
    -c pyop:pyop \
    --exec /opt/pyop/bin/gunicorn \
    --pidfile /var/run/pyop.pid \
    --chdir /opt/pyop/src \
    -- \
    example.wsgi:app \
    -b :9090

