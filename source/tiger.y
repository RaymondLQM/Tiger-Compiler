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

proc: 
	exp {}
	;

exp: 
	'-' exp
	|INT
	|STRING
	|NIL
	|lvalue
	|exp '+' exp
	|exp '*' exp
	|exp '/' exp
	|exp '-' exp
	|exp OR exp
	|exp AND exp
	|exp EQ exp
	|exp NE exp
	|exp LE exp
	|exp LEEQ exp
	|exp LA exp
	|exp LAEQ exp
	|lvalue ASSIGN exp
	|ID '(' explist ')'
	|ID '(' ')'
	|'(' expseq ')'
	|'(' ')'
	|ID '(' fieldlist ')'
	|ID '(' ')'
	|ID '[' exp ']' OF exp
	|IF exp THEN exp
	|IF exp THEN exp ELSE exp
	|WHILE exp DO exp
	|FOR ID ASSIGN exp TO exp DO exp
	|BREAK
	|LET decs IN END
	|LET decs IN expseq END {}

	;
lvalue:
	lvalue '[' exp ']'
	|lvalue '.' ID
	|ID
	|ID '[' exp ']' {}
	;

explist:
	exp
	|exp ',' explist {}
	;

expseq:
	exp
	|exp ';' expseq {}
	;

fieldlist:
	ID EQ exp
	|ID EQ exp ',' fieldlist {}
	;

decs:
	dec
	|dec decs {}
	;

dec:
	tydec
	|vardec
	|fundec {}
	;

tydec:
	TYPE ID EQ ty {}
	;

ty:
	ID
	|'{' tyfields '}'
	|'{' '}'
	|ARRAY OF ID {}
	;

tyfields:
	ID ':' ID
	|ID ':' ID ',' tyfields {}

vardec:
	VAR ID ASSIGN exp
	|VAR ID ':' ID ASSIGN exp {}
	;

fundec:
	FUNCTION ID '(' ')' EQ exp
	|FUNCTION ID '(' tyfields ')' EQ exp
	|FUNCTION ID '(' ')' ':' ID EQ exp
	|FUNCTION ID '(' tyfields ')' ':' ID EQ exp {}
	;
 
%%
int main(int argc, char **argv){
	yyparse();
}
void yyerror(char *s){
	printf("Error\n");
}
