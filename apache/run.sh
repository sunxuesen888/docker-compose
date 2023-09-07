#!/bin/bash
#清理http缓存
rm -rf /run/httpd/*
#指定前台运行
/usr/sbin/apachectl -D FOREGROUND