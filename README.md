# billing_django

# 功能介绍

## 前端代码地址
1. Android https://github.com/niupuyue/Billing
2. 小程序(正在开发中...)
3. Flutter(正在开发中...)
4. H5(正在开发中...)
5. IOS(正在开发中...)

# 使用方式

## Macos

### 开发环境
1. pycharm 2021.1.3
2. python 3.8
3. 下载并安装docker https://www.docker.com/

### 启动项目
创建虚拟环境
```shell
# 创建虚拟环境
virtualenv --python /usr/local/bin/python3 venv
# 进入虚拟环境
source venv/bin/activate
# 退出依赖环境
deactivate
```

在项目根目录中执行下面的命令
```shell
# 创建Django项目
python manage.py startapp billing_django
# pip安装依赖
pip3 install -r requirements.txt
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt
pip3 freeze > requirements.txt
# 数据库迁移命令
python3 manage.py makemigrations
# 同步数据库
python3 manage.py migrate
# 创建超级用户
python3 manage.py createsuperuser
# 执行如下命令会自动创建static文件夹，并把静态文件全部复制到static文件夹中
python3 manage.py collectstatic
# 测试环境下启动
python3 manage.py runserver 0.0.0.0:5003
# 使用配置文件启动
gunicorn billing_django.wsgi:application -c gunicorn_config.py
# 使用bash脚本启动
chmod ugo+x gunicorn_dev.sh
chmod ugo+x gunicorn_dev_shutdown.sh
./gunicorn_dev.sh
# mac中杀死进程
ps -ef | grep gunicorn
kill -9 1234
# Linux中使用脚本杀死应用
./gunicorn_dev_shutdown.sh
```

手动启动Gunicorn
```shell
# 启动Gunicorn
gunicorn boluomi.wsgi:application --bind 0.0.0.0:8080 --workers 2
# 关闭Gunicorn
$ pstree | grep gunicorn | grep -v grep | awk 'NR==1{system("kill -QUIT "$2)}'
# 重启Gunicorn
$ pstree | grep gunicorn | grep -v grep | awk 'NR>1{system("kill -HUP "$2)}'
```