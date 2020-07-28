CC = gcc
AR=gcc-ar

INCDIR = inc
SRCDIR = src
OBJDIR = obj
LIBDIR = lib

TARGET = libwn.a

OBJS = $(addprefix $(OBJDIR)/,binsrch.o morph.o search.o wnglobal.o wnrtl.o wnutil.o)
LIBS = $(addprefix $(LIBDIR)/,$(TARGET))

CFLAGS = '-I./inc' -g -O2 -flto -Wall -Wextra -pedantic -std=c99 \
-fstrict-aliasing -Wno-unused-parameter -fstrict-aliasing \
-Wno-missing-field-initializers -Wformat

.PHONY: all clean

all: $(LIBS)

$(LIBS) : $(LIBDIR) $(INCDIR)/wn.h

$(LIBDIR)/%.a : $(OBJS)
	$(AR) rcs $@ $(OBJS)

$(OBJS) : | $(OBJDIR)

$(OBJDIR)/%.o : $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -o $@ -c $<

$(OBJDIR) :
	mkdir $(OBJDIR)

$(LIBDIR) :
	mkdir $(LIBDIR)

clean:
	rm -rf $(OBJDIR) $(LIBDIR)
