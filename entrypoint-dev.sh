#!/bin/sh

if [ "$PROJECT_SERVICE_TYPE" = "api" ];
 then
  echo ">>> Starting Node.js"
  npm start
fi