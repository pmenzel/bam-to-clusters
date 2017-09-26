INCLUDES = -I../htslib
CC = gcc
OPTS = -Wall -Wextra -O2 -g -std=c99

.PHONY:	all htslib clean

.SUFFIXES: .c .o

%.o : %.c Makefile
	$(CC) -c $(OPTS) $(INCLUDES) $< -o $@

all: bam_to_clusters

htslib:
	$(MAKE) -j -C ../htslib

bam_to_clusters: htslib bam_to_clusters.o
	$(CC) -o bam_to_clusters bam_to_clusters.o ../htslib/libhts.a -lz -lpthread

clean:
	rm -f *.o bam_to_clusters
