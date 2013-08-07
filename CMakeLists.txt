project(libparserutils)
set(LIB "libparserutils")
set(${LIB}_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/include)

set(${LIB}_PUBLIC_HEADERS
	include/parserutils/errors.h
	include/parserutils/functypes.h
	include/parserutils/parserutils.h
	include/parserutils/types.h
	
	include/parserutils/charset/codec.h
	include/parserutils/charset/mibenum.h
	include/parserutils/charset/utf16.h
	include/parserutils/charset/utf8.h
	
	include/parserutils/input/inputstream.h
	
	include/parserutils/utils/buffer.h
	include/parserutils/utils/stack.h
	include/parserutils/utils/vector.h
)

set(${LIB}_SOURCES
	src/charset/aliases.c
	src/charset/codec.c
	
	src/charset/codecs/codec_8859.c
	src/charset/codecs/codec_ascii.c
	src/charset/codecs/codec_ext8.c
	src/charset/codecs/codec_utf16.c
	src/charset/codecs/codec_utf8.c
	
	src/charset/encodings/utf16.c
	src/charset/encodings/utf8.c
	
	src/input/filter.c
	src/input/inputstream.c
	
	src/utils/buffer.c
	src/utils/errors.c
	src/utils/stack.c
	src/utils/vector.c
)

set(${LIB}_STATIC ON)
set(${LIB}_DYNAMIC OFF)

include(Install)