# makefile credit to the pspdev organization on github
LUA = .

PSPSDK = $(shell psp-config --pspsdk-path)
PSPDIR = $(shell psp-config --psp-prefix)

CFLAGS = -O2 -G0 -I$(LUA)/include

CORE_O=	lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o\
        lfunc.o lgc.o llex.o lmem.o lobject.o\
        lopcodes.o lparser.o lstate.o lstring.o ltable.o \
	      ltm.o lundump.o lvm.o lzio.o
LIB_O=	lauxlib.o lbaselib.o lcorolib.o ldblib.o\
        liolib.o lmathlib.o loslib.o lstrlib.o ltablib.o\
        loadlib.o linit.o
BASE_O= $(CORE_O) $(LIB_O)

OBJS = $(BASE_O)
TARGET_LIB = liblua.a

include $(PSPSDK)/lib/build.mak

install: all
	mkdir -p $(PSPDIR)/include $(PSPDIR)/lib
	cp lua.h luaconf.h lualib.h lauxlib.h $(PSPDIR)/include
	cp *.a $(PSPDIR)/lib