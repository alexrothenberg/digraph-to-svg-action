#!/bin/sh
set -e

dot -Tsvg images/documentation_signals.dot -o images/documentation_signals.svg

sh -c "git config --global user.name '${GITHUB_ACTOR}' \
      && git config --global user.email '${GITHUB_ACTOR}@users.noreply.github.com' \
      && git add -A && git commit -m '$*' --allow-empty \
      && git push -u origin HEAD"

