%{
	#include <stdio.h>
	#include <string.h>
	#include "absyn.h"
	#include "util.h"
	#include "symbol.h"

	int yylex(void);
	A_exp program_root;
	int tokPos = 0;
%}
%union{
	int ival;
	string sval;
	A_var var;
	A_exp exp;
	A_dec dec;
	A_ty ty;
	A_decList decList;
	A_expList expList;
	A_field field;
	A_fieldList fieldList;
	A_fundec fundec;
	A_fundecList fundecList;
	A_namety namety;
	A_nametyList nametyList;
	A_efield efield;
	A_efieldList efieldList;
}
%token <sval> ID STRING
%token <ival> INT
%token 
  COMMA COLON SEMICOLON LPAREN RPAREN LBRACK RBRACK LBRACE RBRACE DOT 
  PLUS MINUS TIMES DIVIDE EQ NE LT LE GT GE
  AND OR ASSIGN
  ARRAY IF THEN ELSE WHILE FOR TO DO LET IN END OF 
  BREAK NIL FUNCTION VAR TYPE 
  EOL ERROR

%type <exp> Exp Program
%type <expList> ExpList
%%
Program: 
	exp { program_root = $1; }
Exp:
	ID { $$ = A_VarExp(tokPos, A_SimpleVar(tokPos, S_Symbol($1))); }
	|NIL { $$ = A_NilExp(tokPos); }
	|INT { $$ = A_IntExp(tokPos, $1); }
	|STRING { $$ = A_StringExp(tokPos, $1); }
	|ID LPAREN ExpList RPAREN { $$ = A_CallExp(tokPos, S_Symbol($1), $3); }
	|ID LPAREN RPAREN { $$ = A_CallExp(tokPos, S_Symbol($1), $3); }
%%
int main(int argc, char **argv){
	yyparse();
}
void yyerror(char *s){
	printf("Error\n");
}

