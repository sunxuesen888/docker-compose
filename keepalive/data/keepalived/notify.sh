  #!/bin/bash

TYPE=$1
NAME=$2
STATE=$3

case $STATE in
        "MASTER") echo "status: MASTER" >> /dev/stdout
		  ip addr add 192.168.254.254/32 dev eth0 label eth0:vip1
		  ip addr add 192.168.254.253/32 dev eth0 label eth0:viplb
                  exit 0
                  ;;
        "BACKUP") echo "status: BACKUP" >> /dev/stdout
		  ip addr delete 192.168.254.254/32 dev eth0
		  ip addr add 192.168.254.253/32 dev eth0 label eth0:viplb
                  exit 0
                  ;;
        "FAULT")  echo "status: ERROR" >> /dev/stderr
		  ip addr delete 192.168.254.254/32 dev eth0
		  ip addr add 192.168.254.253/32 dev eth0 label eth0:viplb
                  exit 0
                  ;;
        *)        echo "status : UNKNOWN" >> /dev/stderr
                  exit 1
                  ;;
esac
