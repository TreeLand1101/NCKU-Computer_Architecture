CC = gcc

CFLAGS = -Wall -Wextra -std=c99

SRCS = $(wildcard *.c)

EXES = $(SRCS:.c=)

OBJS = $(SRCS:.c=.o)

all: $(EXES)

%: %.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f $(EXES) $(OBJS)

.PHONY: all clean
