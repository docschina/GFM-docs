#!/usr/bin/env sh

# Save some useful information
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}

# 生成静态文件
npm run build

# Set some git options
git config --global user.name "Travis CI"
git config --global user.email "ci@travis-ci.org"
git remote set-url origin "${SSH_REPO}"

openssl aes-256-cbc -K $encrypted_7562052d3e34_key -iv $encrypted_7562052d3e34_iv -in scripts/deploy_key.enc -out scripts/deploy_key -d
chmod 600 scripts/deploy_key
eval `ssh-agent -s`
ssh-add scripts/deploy_key
chmod -R 777 node_modules/gh-pages/

# deploy
# 进入生成的文件夹
cd dist

git init
git add -A
git commit -m 'deploy'
git push -f https://github.com/docschina/GFM-docs.git master:gh-pages
rm -rf ../dist
