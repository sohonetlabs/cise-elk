#!/bin/bash

set -ex

TMPDIR=$(mktemp -d)
trap "cd && rm -rf $TMPDIR" EXIT
LSTESTREPO="https://github.com/sohonetlabs/logstash-tester-cise-elk.git"

git clone $LSTESTREPO $TMPDIR
mkdir -p $TMPDIR/data/config/{conf.d,patterns}
cat sources/*/filter.conf >> $TMPDIR/data/config/conf.d/filter.conf
cat sources/syslog/patterns/* >> $TMPDIR/data/config/patterns/patterns
cp tests/* $TMPDIR/data/test/filters/

cd $TMPDIR
./logstash-tester.sh -d data filters
