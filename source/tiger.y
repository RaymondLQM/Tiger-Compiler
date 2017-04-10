%{
	#include <stdio.h>
%}

%token WHILE
%token OTHER
%token EOL
%%

proc: WHILE WHILE EOL { printf("test\n"); }
	;

%%
int main(int argc, char **argv){
	yyparse();
}
void yyerror(char *s){
	printf("Error\n");
}
