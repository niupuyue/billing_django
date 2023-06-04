#!/bin/sh
# gunicorn 关闭后不会自动删掉pid文件，这里自行删掉
# 激活虚拟环境
VIRTUALENV_DIR=~/code/python_project/billing_django/venv
source $VIRTUALENV_DIR/bin/activate
#进入项目目录
DJANGO_DIR=~/code/python_project/billing_django
cd $DJANGO_DIR

for id in `cat gunicorn.pid`;do
kill -9 $id
done
rm -f gunicorn.pid