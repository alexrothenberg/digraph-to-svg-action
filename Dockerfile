FROM alpine:3.10

LABEL "name"="digraph-to-svg"
LABEL "maintainer"="Alex Rothenberg <alex@alexrothenberg.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Convert digraph to svg image using graphviz"
LABEL "com.github.actions.description"="Convert digraph to svg image using graphviz and save restulting svg back into github"
LABEL "com.github.actions.icon"="image"
LABEL "com.github.actions.color"="blue"

RUN apk --update add graphviz

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
