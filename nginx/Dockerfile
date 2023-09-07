FROM centos:latest
MAINTAINER sxs create nginx
LABEL version='nginx v1'
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
WORKDIR /usr/local/src
ENV NG_VERSION=nginx-1.25.1
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install epel-release
RUN yum -y install wget
RUN wget http://nginx.org/download/$NG_VERSION.tar.gz && tar xzvf $NG_VERSION.tar.gz
RUN yum install -y gcc gcc-c++ glibc make autoconf openssl openssl-devel && yum install -y pcre-devel libxslt-devel gd-devel GeoIP GeoIP-devel GeoIP-data
RUN yum clean all
RUN useradd -M -s /sbin/nologin nginx
WORKDIR /usr/local/src/$NG_VERSION
RUN ./configure --user=nginx --group=nginx --prefix=/usr/local/nginx --with-file-aio --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_xslt_module --with-http_image_filter_module --with-http_geoip_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_auth_request_module --with-http_random_index_module --with-http_secure_link_module --with-http_degradation_module --with-http_stub_status_module && make && make install
ADD index.html /usr/local/nginx/html
ADD index.html /tmp
VOLUME /usr/local/nginx/html
ENV PATH /usr/local/nginx/sbin:$PATH
WORKDIR /usr/local/nginx/sbin/
EXPOSE 80
#RUN ./nginx
ENTRYPOINT ["nginx"]
CMD ["-g","daemon off;"]
