# repomenu - menu from The-Repo-Club
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c repomenu.c rtest.c util.c
OBJ = $(SRC:.c=.o)

all: options repomenu rtest

options:
	@echo repomenu build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

.c.o:
	$(CC) -c $(CFLAGS) $<

config.h:
	cp config.def.h $@

$(OBJ): arg.h config.h config.mk drw.h

repomenu: repomenu.o drw.o util.o
	$(CC) -o $@ repomenu.o drw.o util.o $(LDFLAGS)

rtest: rtest.o
	$(CC) -o $@ rtest.o $(LDFLAGS)

clean:
	rm -f repomenu rtest $(OBJ) repomenu-$(VERSION).tar.gz config.h

dist: clean
	mkdir -p repomenu-$(VERSION)
	cp LICENSE Makefile README arg.h config.def.h config.mk repomenu.1\
		drw.h util.h repomenu_path repomenu_run rtest.1 $(SRC)\
		repomenu-$(VERSION)
	tar -cf repomenu-$(VERSION).tar repomenu-$(VERSION)
	gzip repomenu-$(VERSION).tar
	rm -rf repomenu-$(VERSION)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f repomenu $(DESTDIR)$(PREFIX)/bin
	cp -f repomenu_* $(DESTDIR)$(PREFIX)/bin
	cp -f rtest $(DESTDIR)$(PREFIX)/bin
	cp -f rmenu $(DESTDIR)$(PREFIX)/bin
	cp -f repomenu $(DESTDIR)$(PREFIX)/bin/dmenu
	cp -f repomenu_path $(DESTDIR)$(PREFIX)/bin/dmenu_path
	cp -f repomenu_run $(DESTDIR)$(PREFIX)/bin/dmenu_run
	cp -f rtest $(DESTDIR)$(PREFIX)/bin/dtest
	chmod 755 $(DESTDIR)$(PREFIX)/bin/repomenu
	chmod 755 $(DESTDIR)$(PREFIX)/bin/repomenu_*
	chmod 755 $(DESTDIR)$(PREFIX)/bin/rtest
	chmod 755 $(DESTDIR)$(PREFIX)/bin/rmenu
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_path
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_run
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dtest
	mkdir -p $(DESTDIR)$(SHAREPREFIX)/repomenu
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < repomenu.1 > $(DESTDIR)$(MANPREFIX)/man1/repomenu.1
	sed "s/VERSION/$(VERSION)/g" < rtest.1 > $(DESTDIR)$(MANPREFIX)/man1/rtest.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/repomenu.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/rtest.1

uninstall:
	rm -rf $(DESTDIR)$(PREFIX)/bin/repomenu\
		$(DESTDIR)$(PREFIX)/bin/repomenu_*\
		$(DESTDIR)$(PREFIX)/bin/rtest\
		$(DESTDIR)$(PREFIX)/bin/rmenu\
		$(DESTDIR)$(PREFIX)/bin/dmenu\
		$(DESTDIR)$(PREFIX)/bin/dmenu_path\
		$(DESTDIR)$(PREFIX)/bin/dmenu_run\
		$(DESTDIR)$(PREFIX)/bin/dtest\
		$(DESTDIR)$(SHAREPREFIX)/repomenu\
		$(DESTDIR)$(MANPREFIX)/man1/repomenu.1\
		$(DESTDIR)$(MANPREFIX)/man1/rtest.1

.PHONY: all options clean dist install uninstall
