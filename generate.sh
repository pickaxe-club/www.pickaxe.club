#!/bin/bash
set -e

mapcrafter -c config.ini -j 1 -f overworld city island western shuffalo
find _map -name '*.jpg' | xargs -P 1 jpegoptim --strip-all
mv _map/* /var/www/html
