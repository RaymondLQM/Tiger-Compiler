%{
#include <string.h>
#include "util.h"
#include "tokens.h"
#include "errormsg.h"

int charPos=1;

int yywrap(void)
{
 charPos=1;
 return 1;
}


void adjust(void)
{
 EM_tokPos=charPos;
 charPos+=yyleng;
}

%}

%%
" "	 {adjust(); continue;}
\n	 {adjust(); EM_newline(); continue;}
","	 {adjust(); return COMMA;}
for  	 {adjust(); return FOR;}
[0-9]+	 {adjust(); yylval.ival=atoi(yytext); return INT;}
while	 {adjust(); return FOR;}
to 	 {adjust(); return TO;}
break	 {adjust(); return BREAK;}
let	 {adjust(); return LET;}
in	 {adjust(); return IN;}
end	 {adjust(); return END;}
function {adjust(); return FUNCTION;}
var	 {adjust(); return VAR;}
type 	 {adjust(); return TYPE;}
array 	 {adjust(); return ARRAY;}
if 	 {adjust(); return IF;}
then	 {adjust(); return THEN;}
else 	 {adjust(); return ELSE;}
do 	 {adjust(); return DO;}
of	 {adjust(); return OF;}
nil	 {adjust(); return NIL;}
":=" 	 {adjust(); return ASSIGN;}

.	 {adjust(); EM_error(EM_tokPos,"illegal token");}

