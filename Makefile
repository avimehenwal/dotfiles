all: clean build

SHELL:=/bin/bash
DIST:=docs
# ANTORA:=./node_modules/@antora/cli/bin/antora
ANTORA:=yarn antora
HTTP-SERVER:=./node_modules/http-server/bin/http-server
MSG_FILE:=COMMIT_MSG.md


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

commit:
	git commit --file=${MSG_FILE}


