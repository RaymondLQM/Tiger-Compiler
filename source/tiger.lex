%{
#include <stdio.h>
#include <string.h>
#include "absyn.h"
#include "util.h"
#include "tiger.tab.h"
%}

id [a-zA-Z][a-zA-Z0-9_]*
int_val [0-9]+
str_val \".*\"
DOT [.]
LP \(
RP \)
LB \[
RB \]
LC \{
RC \}


%%
',' { return COMMA; }
':' { return COLON; }
';' { return SEMICOLON; }
{LP} { return LPAREN; }
{RP} { return RPAREN; }
{LB} { return LBRACK; }
{RB} { return RBRACK; }
{LC} { return LBRACE; }
{RC} { return RBRACE; }
{DOT} { return DOT; }

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

id { 
	//strcpy(yylval.sVal, yytext); 
	return ID; 
	}
int_val { 
	yylval.iVal = atoi(yytext); 
	return INTT; 
	}
str_val { 
	return STRINGG;
	} 
\n {}
.  { return ERROR; }

%%

int yywrap(void){
	return 1;
}
