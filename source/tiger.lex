%{
#include <stdio.h>
#include <string.h>
#include "tiger.tab.h"
#include "absyn.h"
%}

id [a-zA-Z][a-zA-Z0-9_]*
int_val [0-9]+
str_val \".*\"

%%
',' { return COMMA; }
':' { return COLON; }
';' { return SEMICOLON; }
'(' { return LPAREN; }
')' { return RPAREN; }
'[' { return LBRACK; }
']' { return RBRACK; }
'{' { return LBRACE; }
'}' { return RBRACE; }
'.' { return DOT; }

'+' { return PLUS; }
'-' { return MINUS; }
'*' { return TIMES; }
'/' { return DIVIDE; }

"=" { return EQ; }
"<>" { return NE; }
"<" { return LT; }
"<=" { return LE; }
">" { return GT; }
">=" { return GE; }
"&" { return AND; }
"|" { return OR; }
":=" { return ASSIGN; }

while { return WHILE; }
for { return FOR; }
to { return TO; }
break { return BREAK; }
let { return IN; }
end { return END; }
function { return FUNCTION; }
var { return VAR; }
type { return TYPE; }
array { return ARRAY; }
if { return IF; }
then { return THEN; }
else { return ELSE; }
do { return DO; }
of { return OF; }
nil { return NIL; }
operator { return yytext[0]; }



id { 
	strcpy(yylval.str, yytext); 
	return ID; 
	}
int_val { 
	yylval.int_val = atoi(yytext); 
	return INT; 
	}
str_val { 
	int length = strlen(yytext);
	if(length == 2)yylval.str_val = "";
	else substr(yytext, 1, strlen(yytext) - 2, yylval.str_val); 
	return STRING;
	}
\n { return EOL; } 
.  { return ERROR; }

%%

int yywrap(void){
	return 1;
}
