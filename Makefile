heic2jpg.app: heic2jpg.applescript heic2jpg
	rm -rf $@
	osacompile -o $@ heic2jpg.applescript
	cp heic2jpg $@/Contents/Resources/
	codesign --force --sign - $@

INSTALL_DIR ?= /Applications

# Replaces rather than merges, so the installed copy never keeps a stale script.
.PHONY: install
install: heic2jpg.app
	rm -rf "$(INSTALL_DIR)/heic2jpg.app"
	ditto heic2jpg.app "$(INSTALL_DIR)/heic2jpg.app"

.PHONY: clean
clean:
	rm -rf heic2jpg.app
