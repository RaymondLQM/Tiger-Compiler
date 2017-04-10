SOURCE := ./source
TEMP := ./tmp

compiler: $(TEMP)/tiger.tab.o $(TEMP)/lex.yy.o 
	gcc -o compiler $(TEMP)/lex.yy.o $(TEMP)/tiger.tab.o

$(TEMP)/tiger.tab.o: $(TEMP)/tiger.tab.c
	gcc -c $(TEMP)/tiger.tab.c -o $(TEMP)/tiger.tab.o

$(TEMP)/tiger.tab.c: $(SOURCE)/tiger.y
	bison --defines=$(TEMP)/tiger.tab.h -o $(TEMP)/tiger.tab.c $(SOURCE)/tiger.y
	
$(TEMP)/lex.yy.o: $(SOURCE)/tiger.lex 
	flex -o $(TEMP)/lex.yy.c $(SOURCE)/tiger.lex 
	gcc -c $(TEMP)/lex.yy.c -o $(TEMP)/lex.yy.o

clean: 
	rm -f $(TEMP)/*
