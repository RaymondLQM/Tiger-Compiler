
OBJ := main.o absyn.o util.o lex.yy.o tiger.tab.o 

compiler: $(OBJ)
	gcc -o compiler $(OBJ)

main.o: main.c tiger.tab.c
	gcc -c main.c -o main.o

absyn.o: absyn.c
	gcc -c absyn.c -o absyn.o

util.o: util.c
	gcc -c util.c -o util.o

lex.yy.o: lex.yy.c tiger.tab.c
	gcc -c lex.yy.c -o lex.yy.o

tiger.tab.o: tiger.tab.c
	gcc -c tiger.tab.c -o tiger.tab.o

lex.yy.c: tiger.lex 
	flex -o lex.yy.c tiger.lex 

tiger.tab.c:tiger.y
	bison -d tiger.y

clean: 
	rm -f *.o
