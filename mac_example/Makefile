PROGRAM2 := myffmpeg
SRC2 := cmdutils.c ffmpeg.c ffmpeg_filter.c ffmpeg_videotoolbox.c ffmpeg_opt.c
OBJ2 := $(SRC2:.c=.o)

INCLUDE := -I ../mac/include \
	-I ../mac/include/libavutil \
	-I ./

LIBS := -lbz2 -framework CoreFoundation \
	-framework CoreVideo \
	-framework VideoDecodeAcceleration \
	-framework CoreServices

LIB_FFMPEG := ../mac/lib/libavutil.dylib \
	../mac/lib/libavcodec.dylib \
	../mac/lib/libswscale.dylib \
	../mac/lib/libavformat.dylib \
	../mac/lib/libavdevice.dylib \
	../mac/lib/libavfilter.dylib \
	../mac/lib/libpostproc.dylib \
	../mac/lib/libswresample.dylib

.SUFFIXES: .o .c
.c.o:
	gcc -g $(CFLAG) $(INCLUDE) -c -o $@ $<

#all: $(PROGRAM2) encode_video decode_video transcoding
all: transcoding

$(PROGRAM2): $(OBJ2)
	gcc -g -o $@  $(OBJ2) $(LIBS)

encode_video: encode_video.c
	gcc -g -o $@ $(INCLUDE) $< $(LIBS)

decode_video: decode_video.c
	gcc -g -o $@ $(INCLUDE) $< $(LIBS)

transcoding: transcoding.c
	gcc -g -o $@ $(INCLUDE) $< $(LIB_FFMPEG)

clean:
	rm -rf $(PROGRAM1)
	rm -rf $(OBJ1)
	rm -rf $(PROGRAM2)
	rm -rf $(OBJ2)
	rm -rf transcoding
	rm -rf *.o
