PREFIX ?= /usr/local
DESTDIR ?=

install:
	install -Dm755 src/colortune $(DESTDIR)$(PREFIX)/bin/colortune
	install -Dm644 data/colortune.desktop $(DESTDIR)$(PREFIX)/share/applications/colortune.desktop

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/colortune $(DESTDIR)$(PREFIX)/share/applications/colortune.desktop

.PHONY: install uninstall
