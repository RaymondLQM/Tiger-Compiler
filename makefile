SOURCE := ./source
TEMP := ./tmp

OBJ := $(TEMP)/absyn.o $(TEMP)/tiger.tab.o $(TEMP)/lex.yy.o $(TEMP)/symbol.o $(TEMP)/util.o \
		$(TEMP)/table.o
compiler: $(OBJ)
	gcc -o compiler $(OBJ)

$(TEMP)/absyn.o: $(SOURCE)/absyn.c
	gcc -c $(SOURCE)/absyn.c -o $(TEMP)/absyn.o

$(TEMP)/symbol.o: $(SOURCE)/symbol.c
	gcc -c $(SOURCE)/symbol.c -o $(TEMP)/symbol.o
	
$(TEMP)/tiger.tab.o: $(TEMP)/tiger.tab.c
	gcc -c $(TEMP)/tiger.tab.c -o $(TEMP)/tiger.tab.o

$(TEMP)/tiger.tab.c: $(SOURCE)/tiger.y
	bison --defines=$(TEMP)/tiger.tab.h -o $(TEMP)/tiger.tab.c $(SOURCE)/tiger.y
	
$(TEMP)/lex.yy.o: $(SOURCE)/tiger.lex 
	flex -o $(TEMP)/lex.yy.c $(SOURCE)/tiger.lex 
	gcc -c $(TEMP)/lex.yy.c -o $(TEMP)/lex.yy.o

$(TEMP)/util.o: $(SOURCE)/util.c
	gcc -c $(SOURCE)/util.c -o $(TEMP)/util.o

$(TEMP)/table.o: $(SOURCE)/table.c
	gcc -c $(SOURCE)/table.c -o $(TEMP)/table.o
clean: 
	rm -f $(TEMP)/*
