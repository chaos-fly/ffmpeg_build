PROGRAM2 := myffmpeg
SRC2 := cmdutils.c ffmpeg.c ffmpeg_filter.c ffmpeg_videotoolbox.c ffmpeg_opt.c
OBJ2 := $(SRC2:.c=.o)

LDCONFIG := -Wl,-rpath,../mac/lib

INCLUDE := -I ../mac/include \
	-I ../mac/include/libavutil \
	-I ../mac/include/libavformat \
	-I ./

LIBS := -lbz2 -framework CoreFoundation \
	-framework CoreVideo \
	-framework VideoDecodeAcceleration \
	-framework CoreServices

LIB_FFMPEG := ../mac/lib/libavutil.so \
	../mac/lib/libavcodec.so \
	../mac/lib/libswscale.so \
	../mac/lib/libavformat.so \
	../mac/lib/libavdevice.so \
	../mac/lib/libavfilter.so \
	../mac/lib/libpostproc.so \
	../mac/lib/libswresample.so

.SUFFIXES: .o .c
.c.o:
	gcc -g $(CFLAG) $(INCLUDE) -c -o $@ $<

#all: $(PROGRAM2) encode_video decode_video transcoding
#all: $(PROGRAM2)
all: transcoding

$(PROGRAM2): $(OBJ2)
	gcc -g -o $@  $(OBJ2) $(LIBS)

encode_video: encode_video.c
	gcc -g -o $@ $(INCLUDE) $< $(LIBS)

decode_video: decode_video.c
	gcc -g -o $@ $(INCLUDE) $< $(LIBS)

transcoding: transcoding.c
	gcc -g $(LDCONFIG) -o $@ $(INCLUDE) $< $(LIB_FFMPEG)

clean:
	rm -rf $(PROGRAM1)
	rm -rf $(OBJ1)
	rm -rf $(PROGRAM2)
	rm -rf $(OBJ2)
	rm -rf transcoding
	rm -rf *.o
