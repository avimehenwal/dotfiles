all: clean build

SHELL:=/bin/bash
DIST:=docs
ANTORA:=./node_modules/@antora/cli/bin/antora
HTTP-SERVER:=./node_modules/http-server/bin/http-server


clean:
	rm -rf ${DIST}

build:
	DOCSEARCH_ENABLED=true DOCSEARCH_ENGINE=lunr NODE_PATH="$(npm -g root)" \
	${ANTORA} --to-dir ${DIST} \
	--generator=./antora-site-generator-example-html-pages \
	--generator antora-site-generator-lunr \
	antora-playbook.yml
	touch ${DIST}/.nojekyll

web: build
	${HTTP-SERVER} ${DIST}

