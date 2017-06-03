INCLUDE := -I ../mac/include \
	-I ../sdl-devel

.SUFFIXES: .o .c
.c.o:
	gcc $(CFLAG) $(INCLUDE) -c -o $@ $<

all: tutorial02

$(PROGRAM1): $(OBJ1)
	gcc -g -o tutorial01 tutorial01.c \
		$(INCLUDE) \
		../mac/lib/libavformat.dylib \
		../mac/lib/libavcodec.dylib \
		../mac/lib/libswscale.dylib \
		-lz

tutorial02: tutorial02.c
	gcc -g $(INCLUDE) -o tutorial02 tutorial02.c \
		../sdl-devel/SDLMain.m \
		../mac/lib/libavformat.dylib \
		../mac/lib/libavcodec.dylib \
		../mac/lib/libswscale.dylib \
		-lz -lm \
		-I/usr/local/include/SDL  -D_THREAD_SAFE \
		-L/usr/local/lib -lSDL \
		-framework Cocoa

		
clean:
	rm -rf tutorial02 
	rm -rf tutorial03
	rm -rf tutorial04
	rm -rf *.dSYM

