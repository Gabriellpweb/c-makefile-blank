# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects
.PHONY = clean

CC = gcc

CFLAGS = -Wall -I
LFLAGS =

TARGET = MyApp

SRCDIR = src
OBJDIR = obj
BINDIR = bin

SRCS := $(wildcard $(SRCDIR)/*.c)
OBJS := $(SRCS: $(SRCDIR)/%.c=$(OBJDIR)/%.o)

$(BINDIR)/$(TARGET): $(OBJS)
	${CC} ${LFLAGS} $(OBJS) -o $@
	@echo "Linking complete."

$(OBJS): $(OBJDIR)/%.o : $(SRCDIR)/%.c
	@echo "Creating object.."
	${CC} ${CFLAGS} -c $< -o $@
	

clean:
	@echo "Cleaning up..."
	rm -rvf $(OBJDIR)/%.o
	rm -rvf $(BINDIR)/$(TARGET)
