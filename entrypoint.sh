#!/bin/sh
set -exv

echo "hi"
which git
echo "hi2"
echo `pwd`
echo "hi3"
echo `ls`
echo "hi4"

# for f in **/*.dot
# do
#   dot -Tsvg $f -o $f.svg
# done

sh -c "git config --global user.name '${GITHUB_ACTOR}' \
      && git config --global user.email '${GITHUB_ACTOR}@users.noreply.github.com' \
      && git add -A && git commit -m '$*' \
      && git push -u origin HEAD"

