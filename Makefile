prefix = /usr/local
RM := /bin/rm -rf

build: clean
	mkdir build && cd build && cmake ../ && make

package:
	@debuild -uc -us

develop:
	sudo apt install -y devscripts lintian cmake dh-make python-dev build-essential git

install: build
	@install -D build/bin/localproxy $(DESTDIR)$(prefix)/bin/localproxy

clean:
	@echo "Cleaning system"
	@$(RM) build/
	@$(RM) debian/aws-iot-securetunneling-localproxy* debian/.debhelper

.PHONY: install clean develop package build
