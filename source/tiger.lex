%{
#include <stdio.h>
#include <string.h>
#include "tiger.tab.h"
%}

id [a-zA-Z][a-zA-Z0-9_]*
int_val [0-9]+
str_val \".*\"
operator [,:;\(\)\[\]\{\}\.\+\-\*\/]

%%

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

"=" { return EQ; }
"<>" { return NE; }
"<" { return LE; }
"<=" { return LEEQ; }
">" { return LA; }
">=" { return LAEQ; }
"&" { return AND; }
"|" { return OR; }
":=" { return ASSIGN; }

id { strcpy(yylval.str, yytext); return ID; }
int_val { yylval.int_val = atoi(yytext); return INT; }
str_val { strcpy(yylval.str, yytext); return STRING;}
\n { return EOL; } 
.	 { return OTHER; }

%%

int yywrap(void){
	return 1;
}
