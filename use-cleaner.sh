#!/bin/bash
# Copyright 2016 Obsidian-Studios, Inc.
# Author William L. Thomson Jr.
#        wlt@o-sinc.com
#
# Distributed under the terms of The GNU Public License v3.0 (GPLv3)

# Use flag cleaner, pretty straight forward

# shellcheck disable=SC1091
source /etc/portage/make.conf

for flag in ${USE}; do
	equery hasuse "${flag/ -/ }" > /dev/null 2>&1
	if [[ $? -eq 1 ]]; then
		echo "Unused use flag -> ${flag}"
		if [[ "${1}" == "-c" ]]; then
			euse -P "${flag}"
		fi
	fi
done
