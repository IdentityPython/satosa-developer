#!/bin/sh

if [ ! -f satosa/compose.yml ]; then
    echo "Run $0 from the satosa-developer top level directory"
    exit 1
fi

#
# Set up entrys in /etc/hosts for the containers with externally accessible services
#
( printf "127.0.0.1\tfront.satosa.docker\n";
  printf "127.0.0.1\tsp.satosa.docker\n";
  printf "127.0.0.1\tidp.satosa.docker\n";
) \
    | while read line; do
    if ! grep -q "^${line}$" /etc/hosts; then
	echo "$0: Adding line '${line}' to /etc/hosts"
	if [ "x`whoami`" = "xroot" ]; then
	    echo "${line}" >> /etc/hosts
	else
	    echo "${line}" | sudo tee -a /etc/hosts
	fi
    else
	echo "Line '${line}' already in /etc/hosts"
    fi
done

./bin/docker-compose -f satosa/compose.yml rm -f --all
./bin/docker-compose -f satosa/compose.yml up $*
