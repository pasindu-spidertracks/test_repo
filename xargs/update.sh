#!/usr/bin/env bash
if [[ `cat package.json | jq '.devDependencies | has("@spidertracks/eventbus.schema")'` == true ]]; then
   jq '.devDependencies."@spidertracks/eventbus.schema"="^'$VERSION'"' package.json | sponge package.json
fi

if [[ `cat package.json | jq '.dependencies | has("@spidertracks/eventbus.schema")'` == true ]]; then
   jq '.dependencies."@spidertracks/eventbus.schema"="^'$VERSION'"' package.json | sponge package.json
fi

npm i --package-lock-only
