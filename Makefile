# ssdsim linux support
all:ssd 
	
clean:
	rm -f ssd *.o *~
.PHONY: clean

ssd: ssd.o avlTree.o flash.o initialize.o pagemap.o avlTree.o
	gcc -g -o ssd ssd.o avlTree.o flash.o initialize.o pagemap.o -lm 
ssd.o: ssd.c flash.o
	gcc -c -g ssd.c  
flash.o: flash.c initialize.o 
	gcc -c -g flash.c
initialize.o: initialize.c avlTree.o pagemap.o 
	gcc -c -g initialize.c
pagemap.o: pagemap.c initialize.h
	gcc -c -g pagemap.c
avlTree.o: avlTree.c avlTree.h
	gcc -c -g avlTree.c

