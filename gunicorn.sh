#!/bin/bash
# 激活虚拟环境
VIRTUALENV_DIR=~/code_source/billing_django/venv
source $VIRTUALENV_DIR/bin/activate
#进入项目目录
DJANGO_DIR=~/code_source/billing_django
cd $DJANGO_DIR

CRTDIR=$(pwd)
# 判断是否存在日志目录
if [ ! -d "${CRTDIR}/logs/" ]; then
  mkdir ${CRTDIR}/logs
fi

# 判断logs文件夹下是否有upload.log文件，没有则创建，用于记录项目日志
if [ ! -f "${CRTDIR}/logs/gunicorn_access.log" ]; then
  touch ${CRTDIR}/logs/gunicorn_access.log
fi

if [ ! -f "${CRTDIR}/logs/gunicorn_error.log" ]; then
    touch ${CRTDIR}/logs/gunicorn_error.log
fi


#启动Gunicorn服务
gunicorn billing_django.wsgi:application \
--bind 0.0.0.0:5003 \
--config gunicorn_config.py \
--daemon