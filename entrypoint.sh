#!/bin/sh
set -e

function checkForDotFiles() {
  echo ":group Checking for *.dot files"
  for f in **/*.dot
  do
    if [ -e "$f" ]
    then
      echo "Compiling $f into .svg"
      dot -Tsvg $f -o $f.svg
    else
      echo "No dot files exist"
    fi
  done
  echo ":endgroup"
}

function commitSvgFiles() {
  echo ":group Checking for *.dot files"
  if [ -n "`git status -s`" ]
  then
    git config --local user.email "action@github.com"
    git config --local user.name "GitHub Action"
    git add -A
    git commit -m "action create .svg from .dot file"
    # git remote set-url origin https://x-access-token:${{ secrets.GITHUB_TOKEN }}@github.com/${{ github.repository }}
    git push
    echo "Pushing a commit to github"
  else
    echo "No to commit"
  fi
  echo ":endgroup"
}

checkForDotFiles
commitSvgFiles
