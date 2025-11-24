#!/usr/bin/env bash

qemu-system-x86_64 -enable-kvm     \
	-m 8192 -smp cpus=8 -cpu host  \
	-nic passt -drive "format=raw,file=$1" \
	-serial stdio
