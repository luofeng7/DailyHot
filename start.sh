#!/bin/ash

# 替换 API 地址及备案号
find '/app' -name '*.js' -exec sed -i -e 's,http://localhost:6688,'"$API"',g' {} \;
find '/app' -name '*.js' -exec sed -i -e 's,豫ICP备2022018134号-1,'"$ICP"',g' {} \;

# # 启动 httpd 服务器
httpd -f -p 80 -h /app
