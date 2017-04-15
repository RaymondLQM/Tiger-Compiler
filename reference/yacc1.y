%{
	#include <stdio.h>
	#include <string.h>
	#include "absyn.h"
	#include "util.h"
	#include "symbol.h"

	int yylex(void);
	A_exp program_root;
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
%token <sval> ID STRING>
%token <ival> INT
%token 
  COMMA COLON SEMICOLON LPAREN RPAREN LBRACK RBRACK LBRACE RBRACE DOT 
  PLUS MINUS TIMES DIVIDE EQ NE LT LE GT GE
  AND OR ASSIGN
  ARRAY IF THEN ELSE WHILE FOR TO DO LET IN END OF 
  BREAK NIL FUNCTION VAR TYPE 
  EOL ERROR

%type <exp> Exp Program
%type <
%%

Program: 
	Exp {}
	;

Exp: 
	MINUS Exp
	|INT
	|STRING
	|NIL
	|LeftValue
	|Exp PLUS Exp
	|Exp TIMES Exp
	|Exp DIVIDE Exp
	|Exp MINUS Exp
	|Exp OR Exp
	|Exp AND Exp
	|Exp EQ Exp
	|Exp NE Exp
	|Exp LT Exp
	|Exp LE Exp
	|Exp LT Exp
	|Exp LE Exp
	|LeftValue ASSIGN Exp
	|ID LPAREN ExpList RPAREN
	|ID LPAREN RPAREN
	|LPAREN ExpSequence RPAREN
	|LPAREN RPAREN
	|ID LPAREN FieldList RPAREN
	|ID LPAREN RPAREN
	|ID LBRACK Exp RBRACK OF Exp
	|IF Exp THEN Exp
	|IF Exp THEN Exp ELSE Exp
	|WHILT Exp DO Exp
	|FOR ID ASSIGN Exp TO Exp DO Exp
	|BREAK
	|LTT Decs IN END
	|LTT Decs IN ExpSequence END {}

	;
LeftValue:
	LeftValue LBRACK Exp RBRACK
	|LeftValue DOT ID
	|ID
	|ID LBRACK Exp RBRACK {}
	;

ExpList:
	Exp
	|Exp COMMA ExpList {}
	;

ExpSequence:
	Exp
	|Exp SEMICOLON ExpSequence {}
	;

FieldList:
	ID EQ Exp
	|ID EQ Exp COMMA FieldList {}
	;

Decs:
	Dec
	|Dec Decs {}
	;

Dec:
	TypeDec
	|VarDec
	|FunctionDec {}
	;

TypeDec:
	TYPE ID EQ Type {}
	;

Type:
	ID
	|LBRACE TypeFields RBRACE
	|LBRACE RBRACE
	|ARRAY OF ID {}
	;

TypeFields:
	ID COLON ID
	|ID COLON ID COMMA TypeFields {}

VarDec:
	VAR ID ASSIGN Exp
	|VAR ID COLON ID ASSIGN Exp {}
	;

FunctionDec:
	FUNCTION ID LPAREN RPAREN EQ Exp
	|FUNCTION ID LPAREN TypeFields RPAREN EQ Exp
	|FUNCTION ID LPAREN RPAREN COLON ID EQ Exp
	|FUNCTION ID LPAREN TypeFields RPAREN COLON ID EQ Exp {}
	;
 
%%
int main(int argc, char **argv){
	yyparse();
}
void yyerror(char *s){
	printf("Error\n");
}

