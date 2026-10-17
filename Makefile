heic2jpg.app: heic2jpg.applescript heic2jpg
	rm -rf $@
	osacompile -o $@ heic2jpg.applescript
	cp heic2jpg $@/Contents/Resources/
	codesign --force --sign - $@

.PHONY: clean
clean:
	rm -rf heic2jpg.app
