#!/bin/bash

GIT_URL=https://github.com/hakimel/reveal.js.git
TEMPLATE_FILE=presentation.html.j2
TEMPLATE_FOR_SINGLE_FILE=single-file-presentation.html.j2
OUTPUT_FILE=presentation.html
OUTPUT_SINGLE_FILE=single-file-presentation.html

get_newest_version() {
	# proudly stolen from https://wiki.archlinux.org/title/VCS_package_guidelines#The_pkgver()_function
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

checkout_from_git() {
	local version_tag=$1

	if ! [ -d reveal.js.git ]
	then
		git clone ${GIT_URL} reveal.js.git
	fi

	pushd reveal.js.git
		git checkout master
		git pull

		if [ "${version_tag} " == "" ]
		then
			version_tag=$( get_newest_version )
		fi

		git checkout ${version_tag}
	popd
}

render_template() {
	local template_file=$1

	python3 render_html_file.py ${template_file}
}

checkout_from_git
render_template ${TEMPLATE_FILE} > ${OUTPUT_FILE}
render_template ${TEMPLATE_FOR_SINGLE_FILE} > ${OUTPUT_SINGLE_FILE}

