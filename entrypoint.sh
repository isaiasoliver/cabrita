#!/bin/sh

if [ "$PROJECT_SERVICE_TYPE" = "api" ];
 then
  echo ">>> Run Migration"
  eval $(cat .env) python manage.py migrate -v 0
  echo ">>> Starting Gunicorn"
  eval $(cat .env) gunicorn core.wsgi
fi

if [ "$PROJECT_SERVICE_TYPE" = "worker" ];
 then
  echo ">>> Starting Celery Worker"
  eval $(cat .env) celery --app core worker --loglevel=DEBUG
fi

if [ "$PROJECT_SERVICE_TYPE" = "beat" ];
 then
  echo ">>> Starting Celery Beat"
  rm -f /tmp/celerybeat.pid
  eval $(cat .env) celery --app core beat --loglevel=DEBUG --pidfile /tmp/celerybeat.pid --scheduler django_celery_beat.schedulers:DatabaseScheduler
fi

if [ "$PROJECT_SERVICE_TYPE" = "flower" ];
 then
  echo ">>> Starting Celery Flower"
  eval $(cat .env) celery --app core flower --address=0.0.0.0 --port=5555
fi
