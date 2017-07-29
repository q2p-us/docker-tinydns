#!/bin/sh

cat data.tmpl | sed "s/{ADDRESS}/$(curl 'https://api.ipify.org?format=text')/" > data &&
tinydns-data

exec "$@"
