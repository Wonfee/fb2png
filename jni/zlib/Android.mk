LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# measurements show that the ARM version of ZLib is about x1.17 faster
# than the thumb one...

zlib_files := \
	src/adler32.c \
	src/compress.c \
	src/crc32.c \
	src/deflate.c \
	src/gzclose.c \
	src/gzlib.c \
	src/gzread.c \
	src/gzwrite.c \
	src/infback.c \
	src/inflate.c \
	src/inftrees.c \
	src/inffast.c \
	src/trees.c \
	src/uncompr.c \
	src/zutil.c

LOCAL_MODULE := libz
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -O3 -DUSE_MMAP
LOCAL_SRC_FILES := $(zlib_files)
#include $(BUILD_SHARED_LIBRARY)
include $(BUILD_STATIC_LIBRARY)

#############################################

#include $(CLEAR_VARS)

#LOCAL_MODULE := libz
#LOCAL_MODULE_TAGS := optional
#LOCAL_CFLAGS += -O3 -DUSE_MMAP
#LOCAL_SRC_FILES := $(zlib_files)
#include $(BUILD_STATIC_LIBRARY)

###########################################

include $(CLEAR_VARS)
LOCAL_SRC_FILES:=        \
	src/test/minigzip.c
LOCAL_MODULE:= gzip
#LOCAL_SHARED_LIBRARIES := libz
LOCAL_STATIC_LIBRARIES := libz
include $(BUILD_EXECUTABLE)

##########################################

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=        \
	src/test/minigzip.c
LOCAL_MODULE:= minigzip
LOCAL_STATIC_LIBRARIES := libz
#LOCAL_SHARED_LIBRARIES := libz
include $(BUILD_EXECUTABLE)
