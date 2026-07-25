#!/bin/bash

rm -rf 2go >/dev/null 2>&1

ARCH=$(uname -m)
case $ARCH in
    "aarch64" | "arm64" | "arm")
        wget https://dl.naixi.net/argox/arm64/argox -O 2go
        ;;
    "x86_64" | "amd64" | "x86")
        wget https://dl.naixi.net/argox/amd64/argox -O 2go
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

chmod +x 2go && ./2go
echo -e "\n\033[1;32m安装完成\033[0m"
echo -e "\n\033[1;32m一键卸载命令：ps aux | grep -E '[w]eb|[n]pm|[b]ot' | awk '{print $2}' | xargs -r -n 1 kill -9\033[0m"