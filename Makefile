LSREGISTER := /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister

# Spotlight skips "*.noindex" directories. Without that, LaunchServices keeps
# re-registering the build in the repo, and "Open With" lists heic2jpg twice.
BUILD_DIR := build.noindex
APP := $(BUILD_DIR)/heic2jpg.app

# osacompile only declares a wildcard document type, which Finder's "Open With"
# menu ignores. The HEIC entry is ranked Alternate so the droplet is listed
# there without replacing the default viewer; the wildcard entry stays so that
# folders can still be dropped onto the icon.
$(APP): heic2jpg.applescript heic2jpg Makefile
	rm -rf $@
	mkdir -p $(BUILD_DIR)
	osacompile -o $@ heic2jpg.applescript
	cp heic2jpg $@/Contents/Resources/
	plutil -insert CFBundleIdentifier -string com.serendipitynz.heic2jpg $@/Contents/Info.plist
	plutil -insert CFBundleDocumentTypes.0 -json '{"CFBundleTypeName":"HEIF Image","CFBundleTypeRole":"Viewer","LSHandlerRank":"Alternate","LSItemContentTypes":["public.heic","public.heif"]}' $@/Contents/Info.plist
	codesign --force --sign - $@

INSTALL_DIR ?= /Applications

# Replaces rather than merges, so the installed copy never keeps a stale script.
# Registering right away puts it in "Open With" without waiting for Spotlight.
.PHONY: install
install: $(APP)
	rm -rf "$(INSTALL_DIR)/heic2jpg.app"
	ditto $(APP) "$(INSTALL_DIR)/heic2jpg.app"
	$(LSREGISTER) -f "$(INSTALL_DIR)/heic2jpg.app"

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
