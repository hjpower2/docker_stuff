#!/bin/bash



RM_IMG()	{
	IMG_NM="$1"
	IMG_ID=$(sudo docker images | awk '/'"$IMG_NM"'/ {print $3}')
	echo "IMG_ID is ${IMG_ID}"
	if [ -n "${IMG_ID}" ]; then
		sudo docker rmi "${IMG_ID}"
		echo "removed $IMG_ID"
	else
		echo "did not remove ${IMG_NM}"
	fi
}

for input in "$@"; do
	RM_IMG "${input}"
done
