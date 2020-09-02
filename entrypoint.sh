#!/bin/sh
set -e

function checkForDotFiles() {
  echo "::group::Checking for *.dot files"
  for f in **/*.dot
  do
    if [ -e "$f" ]
    then
      echo "Compiling $f into $f.svg"
      dot -Tsvg $f -o $f.svg
    else
      echo "No dot files exist"
    fi
  done
  echo "::endgroup::"
}

function commitSvgFiles() {
  echo "::group::Commit new & changed .svg files"
  if [ -n "`git status -s`" ]
  then
    git config --local user.email "action@github.com"
    git config --local user.name "GitHub Action"
    git add -A
    git commit -m "action create .svg from .dot file"
    git push
    echo "Pushing a commit to github"
  else
    echo "Nothing to commit"
  fi
  echo "::endgroup::"
}

checkForDotFiles
commitSvgFiles
