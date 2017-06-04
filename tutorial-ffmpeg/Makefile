INCLUDE := -I ../mac/include \
	-I ../sdl-devel

COMM_SRC := ../sdl-devel/SDLMain.m

LINKLIB := ../mac/lib/libavformat.dylib \
	../mac/lib/libavcodec.dylib \
	../mac/lib/libswscale.dylib \
	../mac/lib/libavutil.dylib \
	-lz -lm \
	-I/usr/local/include/SDL  -D_THREAD_SAFE \
	-L/usr/local/lib -lSDL \
	-framework Cocoa

.SUFFIXES: .o .c
.c.o:
	gcc $(CFLAG) $(INCLUDE) -c -o $@ $<

all: tutorial05

$(PROGRAM1): $(OBJ1)
	gcc -g -o tutorial01 tutorial01.c \
		$(INCLUDE) \
		../mac/lib/libavformat.dylib \
		../mac/lib/libavcodec.dylib \
		../mac/lib/libswscale.dylib \
		-lz

tutorial02: tutorial02.c
	gcc -g $(INCLUDE) -o tutorial02 tutorial02.c $(COMM_SRC) $(LINKLIB)

tutorial03: tutorial03.c
	gcc -g $(INCLUDE) -o tutorial03 tutorial03.c $(COMM_SRC) $(LINKLIB)

tutorial04: tutorial04.c
	gcc -g $(INCLUDE) -o tutorial04 tutorial04.c $(COMM_SRC) $(LINKLIB)

tutorial05: tutorial05.c
	gcc -g $(INCLUDE) -o tutorial05 tutorial05.c $(COMM_SRC) $(LINKLIB)
		
clean:
	rm -rf tutorial02 
	rm -rf tutorial03
	rm -rf tutorial04
	rm -rf tutorial05
	rm -rf *.dSYM

