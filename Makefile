# Makefile for proxytunnel
#
# Please uncomment the appropriate settings

CC = gcc
CFLAGS = -Wall -DHAVE_GETOPT_LONG
LDFLAGS =
INSTALLPATH = $(DESTDIR)/usr/local/bin
MANPATH = $(DESTDIR)/usr/local/man/man1

PROGNAME = proxytunnel
OBJ = proxytunnel.o	\
	base64.o	\
	io.o		\
	http.o		\
	basicauth.o	\
	messages.o	\
	cmdline.o

proxytunnel: $(OBJ)
	$(CC) -o $(PROGNAME) $(LDFLAGS) $(OBJ)

clean:		
	@rm -f $(PROGNAME) $(OBJ)

install:
		mkdir -p $(INSTALLPATH)
		install -g root -m755 -o root $(PROGNAME) $(INSTALLPATH)/$(PROGNAME)
		install -g root -m644 -o root debian/$(PROGNAME).1 $(MANPATH)/$(PROGNAME).1
