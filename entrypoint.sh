#!/bin/sh
set -exv

echo "In the digraph-to-svg action"

echo `find .`

echo `ls **/*.dot`

for f in **/*.dot
do
  if [ -e "$f" ]
  then
    echo begin $f
    dot -Tsvg $f -o $f.svg
    echo $f

  else
    echo "No dot files exist"
  fi
done

if [ -n "`git status -s`" ]
then
  git config --local user.email "action@github.com"
  git config --local user.name "GitHub Action"
  git add -A
  git commit -m "action create .svg from .dot file"
  # git remote set-url origin https://x-access-token:${{ secrets.GITHUB_TOKEN }}@github.com/${{ github.repository }}
  git push
else
  echo "Nothing changed"
fi


echo "all files done"
echo `find .`
echo `git status`
echo `git config --list`

# sh -c "git config --global user.name '${GITHUB_ACTOR}' \
#       && git config --global user.email '${GITHUB_ACTOR}@users.noreply.github.com' \
#       && git add -A && git commit -m '$*' \
#       && git push -u origin HEAD"


# #!/bin/bash

# ROOT=/root

# if [[ ! -d "$ROOT/.ssh" ]]; then
#     echo "$ROOT/.ssh does not exist, creating it"
#     mkdir -p "$ROOT/.ssh"
# fi

# if [[ -z "$INPUT_SSH_KNOWN_HOSTS" ]]; then
#     echo "adding github.com to known_hosts"
#     ssh-keyscan -t rsa github.com > $ROOT/.ssh/known_hosts
# else
#     echo "adding user defined known_hosts"
#     echo "$INPUT_SSH_KNOWN_HOSTS" > $ROOT/.ssh/known_hosts
# fi

# echo "adding ssh key"
# ssh-agent -a "$SSH_AUTH_SOCK" > /dev/null
# echo "$INPUT_SSH_KEY" | tr -d '\r' | ssh-add -

# echo "updating git config"
# git config --global user.name "$INPUT_NAME"
# git config --global user.email "$INPUT_EMAIL"

# rm -rf repo && mkdir repo
# git clone "$INPUT_REPOSITORY" repo

# echo "copying changes"
# rsync -vr "$INPUT_CHANGES"/ repo

# ts=$(date '+%Y-%m-%d %H:%M:%S')
# cd repo || exit
# if [[ $(git status -s) ]]; then
#     git add .
#     git commit -m "auto-update - $ts"
#     echo "deploying changed"
#     git push origin master
# else
#     echo "no changes detected, skipping push"
# fi
