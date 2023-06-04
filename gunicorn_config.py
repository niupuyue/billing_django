import os

# 使用gevent模式，还可以使用sync 模式，默认的是sync模式
worker_class = 'gevent'
# 日志级别，这个日志级别指的是错误日志的级别，而访问日志的级别无法设置
loglevel = 'info'
# 进程数
workers = 4
# 指定每个进程开启的线程数
threads = 2
# 单个worker 最大并发数量
worker_connections = 1000
# 多少个请求worker启动一次，防止内存泄露
max_requests = 20000
# 都懂数量，防止多个worker同时重启
max_requests_jitter = 100
# 限制请求行数
limit_request_line = 4096
# 限制请求头数量
limit_request_fields = 100
# 限制请求头大小
limit_request_field_size = 8190
# 超时设置
timeout = 600
graceful_timeout = 600

bind = '0.0.0.0:5003'

# 日志输出相关
access_log_format = '%(t)s %(p)s %(h)s "%(r)s" %(s)s %(L)s %(b)s %(f)s" "%(a)s"'
accesslog = "./logs/gunicorn_access.log"  # 访问日志文件
errorlog = "./logs/gunicorn_error.log"  # 错误日志文件
# 将异常捕获信息输出到errorlog
capture_output = True
