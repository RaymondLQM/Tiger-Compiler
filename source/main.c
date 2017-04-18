#include <stdio.h>
#include "util.h"
#include "absyn.h"
#include "tiger.tab.h"
int main(void){
	yyparse();
	printf("Parse Done\n");
	return 0;
}