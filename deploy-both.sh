#!/bin/bash

echo "开始构建..."
npx hexo clean
npm run build

echo "部署到 GitHub..."
# 临时修改配置为 GitHub（兼容 macOS 和 Linux 的 sed）
if sed --version >/dev/null 2>&1; then
  # GNU sed (Linux)
  sed -i 's|https://gitee.com/yujianhui1993/blog.git|https://github.com/yujianhui1993/yujianhui1993.github.io.git|g' _config.yml
  sed -i 's|branch: master|branch: main|g' _config.yml
else
  # BSD sed (macOS)
  sed -i '' 's|https://gitee.com/yujianhui1993/blog.git|https://github.com/yujianhui1993/yujianhui1993.github.io.git|g' _config.yml
  sed -i '' 's|branch: master|branch: main|g' _config.yml
fi
hexo deploy

echo "部署到 Gitee..."
# 修改配置为 Gitee（兼容 macOS 和 Linux 的 sed）
if sed --version >/dev/null 2>&1; then
  # GNU sed (Linux)
  sed -i 's|https://github.com/yujianhui1993/yujianhui1993.github.io.git|https://gitee.com/yujianhui1993/blog.git|g' _config.yml
  sed -i 's|branch: main|branch: master|g' _config.yml
else
  # BSD sed (macOS)
  sed -i '' 's|https://github.com/yujianhui1993/yujianhui1993.github.io.git|https://gitee.com/yujianhui1993/blog.git|g' _config.yml
  sed -i '' 's|branch: main|branch: master|g' _config.yml
fi
hexo deploy

echo "部署完成！"
echo "GitHub: https://yujianhui1993.github.io"
echo "Gitee: https://yujianhui1993.gitee.io/blog"