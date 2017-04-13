%{
/* A caculator that can deal with int and real numbers.
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "lex.yy.c"
%}
%union {
    double double_val;
    int int_val;
    struct
	{
		int iv;
    	double dv;
    	int iod;
	}struct_val;
}
%token <double_val>DOUBLE
%token <int_val>INT
%type <struct_val> exp 
%type <struct_val> result

%left '-' '+'
%left '*' '/'
%right '^'
%nonassoc UMINUS


%%
program:
		program result '\n'
		|
		;
result : 
		exp {
				if($1.iod==1)
					printf("%g\n",$1.dv);
				else
					printf("%d\n",$1.iv);
			}
		;
exp:
		INT    		 {$$.iv = $1; $$.dv = (double)$1; $$.iod = 0;}
		|DOUBLE 	 {$$.iv = (int)$1; $$.dv = $1; $$.iod = 1;}
		|exp '+' exp {
						$$.iv = $1.iv + $3.iv; 
						$$.dv = $1.dv + $3.dv; 
						if($1.iod||$3.iod)
							$$.iod = 1;
						else $$.iod = 0;
					}
		|exp '-' exp {
						$$.iv = $1.iv - $3.iv; 
						$$.dv = $1.dv - $3.dv;
						if($1.iod||$3.iod)
							$$.iod = 1;
						else $$.iod = 0;
					}
		|exp '*' exp {
						$$.iv = $1.iv * $3.iv; 
						$$.dv = $1.dv * $3.dv;
						if($1.iod||$3.iod)
							$$.iod = 1;
						else $$.iod = 0;
					}
		|exp '/' exp {
						if($3.iv == 0)
						{
							yyerror("divide by zero");
                            exit(0);
						}
						else $$.iv = $1.iv / $3.iv;
						if($3.dv == 0)
						{
							yyerror("divide by zero");
                            exit(0);
						}
						else $$.dv = $1.dv / $3.dv;

						if($1.iod||$3.iod)
							$$.iod = 1;
						else $$.iod = 0;
					}
		|'-' exp %prec UMINUS	{
									$$.iv = -$2.iv;
									$$.dv = -$2.dv;
									if($2.iod == 1)
										$$.iod = 1;
									else $$.iod = 0;
								}
		|'(' exp ')' 	{
							$$.iv = $2.iv;
							$$.dv = $2.dv;
							if($2.iod == 1)
								$$.iod = 1;
							else $$.iod = 0;
						}
		|exp '^' exp {
						$$.iv = (int)pow($1.iv, $3.iv);
						$$.dv = pow($1.dv, $3.dv);
						if($1.iod == 1)
							$$.iod = 1;
						else $$.iod = 0;
					}
		;
%%
int main()
{
	return yyparse();
}
