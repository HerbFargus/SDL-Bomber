#DBG = -g
CC	= gcc
CFLAGS	= -O2 -Wall $(shell sdl-config --cflags) $(DBG)

all: bomber matcher

bomber:	bomber.o gfx.o sound.o matcher
	gcc -o bomber bomber.o gfx.o sound.o $(shell sdl-config --libs) $(DBG)

matcher: matcher.c

bomber.o: bomber.c bomber.h gfx.h

gfx.o:	gfx.c gfx.h bomber.h

sound.o:	sound.c

clean:
	rm -f *.o matcher bomber

test:	all
	./bomber




WORK = /ram
VER = 1.0.4
DDIR = SDL_bomber-$(VER)

package:  clean
	rm -rf $(WORK)/$(DDIR)
	mkdir $(WORK)/$(DDIR)
	cp *.c *.h Makefile* README INSTALL COPYING AUTHORS TODO $(WORK)/$(DDIR)
	cp -a data $(WORK)/$(DDIR)
	cp ChangeLog $(WORK)/$(DDIR)
	cd $(WORK) && tar czf $(DDIR).tgz $(DDIR)
