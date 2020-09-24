#!/bin/bash
#
# Usage: ./update.sh x.y.z
#
# This script runs to create a Dockerfile for a new Drush version.
# If you specify a partial version, like '8' or '8.0', it will determine the most recent sub version like 8.0.1.
set -eo pipefail

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	echo "Usage: bash update.sh [version ...]"
	exit 1
fi
versions=( "${versions[@]%/}" )

function writeFiles {
	local fullVersion=$1

	shortVersion=$(echo $fullVersion | sed -r -e 's/^([0-9]+).*/\1/')
		targetDir="$shortVersion"
		template=Dockerfile.template

	mkdir -p "$targetDir"
	cp $template "$targetDir/Dockerfile"
	if [[ -f docker-entrypoint.sh ]]; then
		cp -r docker-entrypoint.sh "$targetDir"
	fi

	oldVersion=7
	if [ "$shortVersion" -le "$oldVersion" ]; then
	baseVersion="drush-base-old"
	else
	baseVersion="drush-base"
	fi
	sed -r -i -e 's/DRUSH_FULL_VERSION/'"$fullVersion"'/g' "$targetDir/Dockerfile"
	sed -r -i -e 's/BASE_IMAGE/'"$baseVersion"'/g' "$targetDir/Dockerfile"
	rm "$targetDir/Dockerfile-e"
}

tags="$(git ls-remote --tags https://github.com/drush-ops/drush.git | cut -d/ -f3 | cut -d^ -f1 | cut -dv -f2 | sort -rV)"

for version in "${versions[@]}"; do
	possibleVersions="$(echo "$tags" | grep "^$version" )"
	if releaseVersions="$(echo "$possibleVersions" | grep -vEm1 'milestone|-alpha|-beta|-rc')"; then
		fullVersion="$releaseVersions"
	else
		fullVersion="$(echo "$possibleVersions" | head -n1)"
	fi

	if [[ -z $fullVersion ]]; then
		echo "Cannot find version: $version"
		exit 1
	fi

	(
		set -x
		writeFiles $fullVersion
	)
done
