
OBJ := absyn.o util.o lex.yy.o tiger.tab.o 

compiler: $(OBJ)
	gcc -o compiler $(OBJ)

absyn.o: absyn.c
	gcc -g -c absyn.c -o absyn.o

util.o: util.c
	gcc -g -c util.c -o util.o

lex.yy.o: lex.yy.c tiger.tab.c
	gcc -g -c lex.yy.c -o lex.yy.o

tiger.tab.o: tiger.tab.c
	gcc -g -c tiger.tab.c -o tiger.tab.o

lex.yy.c: tiger.lex 
	flex -o lex.yy.c tiger.lex 

tiger.tab.c:tiger.y
	bison -d tiger.y

clean: 
	rm -f *.o
