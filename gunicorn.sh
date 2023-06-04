#!/bin/bash
# 激活虚拟环境
VIRTUALENV_DIR=/venv
source $VIRTUALENV_DIR/bin/activate
#进入项目目录
DJANGO_DIR=/data/server/workspace/py-project/boluomi
cd $DJANGO_DIR
#启动Gunicorn服务
gunicorn boluomi.wsgi:application \
--bind 0.0.0.0:8080 \
--workers 2 \
--timeout 30 \
--daemon \
--access-logfile /data/logs/gunicorn/boluomi_access.log \
--error-logfile /data/logs/gunicorn/boluomi_error.log