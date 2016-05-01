#!/usr/bin/env bash

cat phnet.sql > migrate.sql
cat db.sql >> migrate.sql
cat gallery.sql >> migrate.sql
cat refactor.sql >> migrate.sql
