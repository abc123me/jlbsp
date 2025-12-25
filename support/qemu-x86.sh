#!/usr/bin/env bash

img="$1"
shift 1

c() { echo "$@"; "$@"; }
c qemu-system-x86_64 -enable-kvm   \
	-m 8192 -smp cpus=8 -cpu host  \
	-nic passt -drive "format=raw,file=$img" \
	-serial stdio "$@"
