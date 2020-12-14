# instamenu - menu from CynicalTeam
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c instamenu.c itest.c util.c
OBJ = $(SRC:.c=.o)

all: options instamenu itest

options:
	@echo instamenu build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

.c.o:
	$(CC) -c $(CFLAGS) $<

config.h:
	cp config.def.h $@

$(OBJ): arg.h config.h config.mk drw.h

instamenu: instamenu.o drw.o util.o
	$(CC) -o $@ instamenu.o drw.o util.o $(LDFLAGS)

itest: itest.o
	$(CC) -o $@ itest.o $(LDFLAGS)

clean:
	rm -f instamenu itest $(OBJ) instamenu-$(VERSION).tar.gz config.h instamenu

dist: clean
	mkdir -p instamenu-$(VERSION)
	cp LICENSE Makefile README arg.h config.def.h config.mk instamenu.1\
		drw.h util.h instamenu_path instamenu_run itest.1 $(SRC)\
		instamenu-$(VERSION)
	tar -cf instamenu-$(VERSION).tar instamenu-$(VERSION)
	gzip instamenu-$(VERSION).tar
	rm -rf instamenu-$(VERSION)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f instamenu $(DESTDIR)$(PREFIX)/bin
	cp -f instamenu_path $(DESTDIR)$(PREFIX)/bin
	cp -f instamenu_run $(DESTDIR)$(PREFIX)/bin
	cp -f instamenu_emoji $(DESTDIR)$(PREFIX)/bin
	cp -f instamenu_network $(DESTDIR)$(PREFIX)/bin
	cp -f itest $(DESTDIR)$(PREFIX)/bin
	cp -f instamenu $(DESTDIR)$(PREFIX)/bin/dmenu
	cp -f instamenu_path $(DESTDIR)$(PREFIX)/bin/dmenu_path
	cp -f instamenu_run $(DESTDIR)$(PREFIX)/bin/dmenu_run
	cp -f itest $(DESTDIR)$(PREFIX)/bin/dtest
	chmod 755 $(DESTDIR)$(PREFIX)/bin/instamenu
	chmod 755 $(DESTDIR)$(PREFIX)/bin/instamenu_path
	chmod 755 $(DESTDIR)$(PREFIX)/bin/instamenu_run
	chmod 755 $(DESTDIR)$(PREFIX)/bin/instamenu_emoji
	chmod 755 $(DESTDIR)$(PREFIX)/bin/instamenu_network
	chmod 755 $(DESTDIR)$(PREFIX)/bin/itest
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_path
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_run
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dtest
	mkdir -p $(DESTDIR)$(SHAREPREFIX)/instamenu
	cp -f emoji-list $(DESTDIR)$(SHAREPREFIX)/instamenu
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < instamenu.1 > $(DESTDIR)$(MANPREFIX)/man1/instamenu.1
	sed "s/VERSION/$(VERSION)/g" < itest.1 > $(DESTDIR)$(MANPREFIX)/man1/itest.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/instamenu.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/itest.1

uninstall:
	rm -rf $(DESTDIR)$(PREFIX)/bin/instamenu\
		$(DESTDIR)$(PREFIX)/bin/instamenu_path\
		$(DESTDIR)$(PREFIX)/bin/instamenu_run\
		$(DESTDIR)$(PREFIX)/bin/itest\
		$(DESTDIR)$(PREFIX)/bin/dmenu\
		$(DESTDIR)$(PREFIX)/bin/dmenu_path\
		$(DESTDIR)$(PREFIX)/bin/dmenu_run\
		$(DESTDIR)$(PREFIX)/bin/dtest\
		$(DESTDIR)$(SHAREPREFIX)/instamenu\
		$(DESTDIR)$(MANPREFIX)/man1/instamenu.1\
		$(DESTDIR)$(MANPREFIX)/man1/itest.1

.PHONY: all options clean dist install uninstall
