%{
	#include <string.h>
	#include "util.h"
	#include "absyn.h"
	extern int yylex(void);
	extern void showTree(A_exp root);
	A_exp root;
%}

%union {
	int iVal;
	string sVal;
	A_decList decListVal;
	A_exp expVal;
}
%start ProgramRoot
%token <sval> STRINGG
%token <ival> INTT
%token 
  COMMA COLON SEMICOLON LPAREN RPAREN LBRACK RBRACK LBRACE RBRACE DOT 
  PLUS MINUS TIMES DIVIDE EQ NE LT LE GT GE ID
  AND OR ASSIGN
  ARRAY IF THEN ELSE WHILE FOR TO DO LET IN END OF 
  BREAK NIL FUNCTION VAR TYPE 
  ERROR

%type <expVal> Exp ProgramRoot
%type <decListVal> DecList

%%
ProgramRoot:
	Exp { root = $1; }
	;
Exp:
	INTT { $$ = A_IntExp(yylval.iVal); }
	|Exp PLUS Exp { A_oper a = A_plusOP; $$ = A_OpExp(a, $1, $3); }
	|LET DecList IN Exp END { $$ = A_LetExp($2, $4); }
	;

DecList:
	{ $$ = A_DecList(NULL, NULL); }
	;

%%
void yyerror(char *s){
	printf("Error\n");
}

