#!/usr/bin/env sh

install_dtbos() {
	while read file; do
		bname="$(basename "$file")"
		install -m 644 -D "$file" "$TARGET_DIR/lib/firmware/$bname"
		echo install -m 644 -D "$file" "$TARGET_DIR/lib/firmware/$bname"
	done
}

find "$BINARIES_DIR" -name '*.dtbo' | install_dtbos
