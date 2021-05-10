# vrk 
# See LICENSE file for copyright and license details.
.POSIX:

include config.mk

SRC = main.c
OBJ = $(SRC:.c=.o)

all: options main

options:
	@echo main build options:
	@echo "CFLAGS  = $(STCFLAGS)"
	@echo "LDFLAGS = $(STLDFLAGS)"
	@echo "CC      = $(CC)"

config.h:
	cp lib/config.def.h config.h

.c.o:
	$(CC) $(STCFLAGS) -c $<

main.o: lib/config.h lib/main.h

$(OBJ): config.h config.mk

main: $(OBJ)
	$(CC) -o $@ $(OBJ) $(STLDFLAGS)

clean:
	rm -f main $(OBJ) main-$(VERSION).tar.gz

dist: clean
	mkdir -p main-$(VERSION)
	cp -R Makefile config.mk config.def.h $(SRC) main-$(VERSION)
	tar -cf - main-$(VERSION) | gzip > main-$(VERSION).tar.gz
	rm -rf main-$(VERSION)

install: main
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f main $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/main
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < docs/main.1 > $(DESTDIR)$(MANPREFIX)/man1/main.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/main.1
	
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/main
	rm -f $(DESTDIR)$(MANPREFIX)/man1/main.1

.PHONY: all options clean dist install uninstall
