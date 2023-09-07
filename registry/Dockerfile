FROM centos
MAINTAINER SXS CREATE
WORKDIR /tmp
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y  install vim
RUN yum -y  install net-tools
EXPOSE 80
CMD /bin/bash
