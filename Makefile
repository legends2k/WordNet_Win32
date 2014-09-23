CC = gcc
INCDIR = inc
SRCDIR = src
OBJDIR = obj
OBJS = $(addprefix $(OBJDIR)/,binsrch.o morph.o search.o wnglobal.o wnrtl.o wnutil.o)
LIBDIR = lib
LIBS = $(addprefix $(LIBDIR)/,libwn.a)

CFLAGS = '-I./inc'

all: $(LIBS)

$(LIBS) : $(LIBDIR) $(INCDIR)/wn.h

$(LIBDIR)/%.a : $(OBJS)
	ar rcs $@ $(OBJS)

$(OBJS) : $(OBJDIR)

$(OBJDIR)/%.o : $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -o $@ -c $<

libwn.a : $(OBJS)
	ar rcs $@ $(OBJS)

$(OBJDIR) :
	mkdir $(OBJDIR)

$(LIBDIR) :
	mkdir $(LIBDIR)

clean:
	rm -rf $(OBJDIR) $(LIBDIR)
