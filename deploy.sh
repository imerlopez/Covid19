#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
rm docs -r
mkdir docs
cp dist/* docs -r
#cp docs/css/* docs/


# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME


git add -A
git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
git push -f https://github.com/codelopez501/Covid19.git master:gh-pages

cd -