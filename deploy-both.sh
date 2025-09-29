#!/bin/bash

echo "开始构建..."
npx hexo clean
npm run build

echo "部署到 GitHub..."
# 临时修改配置为 GitHub
sed -i '' 's|https://gitee.com/yujianhui1993/blog.git|https://github.com/yujianhui1993/yujianhui1993.github.io.git|g' _config.yml
sed -i '' 's|branch: master|branch: main|g' _config.yml
hexo deploy

echo "部署到 Gitee..."
# 修改配置为 Gitee
sed -i '' 's|https://github.com/yujianhui1993/yujianhui1993.github.io.git|https://gitee.com/yujianhui1993/blog.git|g' _config.yml
sed -i '' 's|branch: main|branch: master|g' _config.yml
hexo deploy

echo "部署完成！"
echo "GitHub: https://yujianhui1993.github.io"
echo "Gitee: https://yujianhui1993.gitee.io/blog"