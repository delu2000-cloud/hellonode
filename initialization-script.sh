#!/bin/bash

# Start the first process - run makemigrations
python3 manage.py makemigrations
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start migrate: $status"
  exit $status
fi

# Start the second process - run migrate
python3 manage.py migrate
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start migrate: $status"
  exit $status
fi

# Start the fifth process - run server
python3 manage.py runserver 0.0.0.0:8000
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start server or listen on 8000: $status"
  exit $status
fi
