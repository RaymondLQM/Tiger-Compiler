%{
/* A Lex program to return the charaters wether it
 * is INT or DOUBLE or operator.
 */
#include "calculater_tab.h"
%}
%%
[0-9]+\.[0-9]*	{
					yylval.double_val = atof(yytext);
					return DOUBLE;
				}
[0-9]+			{
					yylval.int_val = atoi(yytext);
					return INT;
				}
[+\-\*\/()\^]	{
					return yytext[0];
				}
[ \t] 			; /*whitespace*/
[\n]			return yytext[0];
.				yyerror("invalid character");
%%

int yywrap(void)
{
	return 1;
}