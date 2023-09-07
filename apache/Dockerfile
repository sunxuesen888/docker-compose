FROM centos:7
MAINTAINER this is apache image
RUN yum -y install httpd
#开启端口
EXPOSE 80
#复制网站首页文件
ADD index.html /var/www/html/
#指定启动容器时第一个运行的命令，前台运行apache
#方法一
ADD run.sh /run.sh
RUN chmod 755 /run.sh
启动容器时执行的脚本
CMD ["/run.sh"]
#方法二
# ENTRYPOINT ["/usr/sbin/apachectl"]
# CMD ["-D","FOREGROUND"]
