%{
	#include <stdio.h>
	#include <string.h>
%}
%union{
	int int_val;
	char str[80];

}

%token WHILE FOR TO BREAK LET IN END FUNCTION VAR TYPE
%token ARRAY IF THEN ELSE DO OF NIL
%token EQ NE LE LEEQ LA LAEQ AND OR ASSIGN 
%token ID INT STRING
%token EOL OTHER
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
