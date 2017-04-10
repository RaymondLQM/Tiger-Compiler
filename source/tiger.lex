%{
#include <stdio.h>
#include "tiger.tab.h"
%}

%%

while { return WHILE; }
\n { return EOL; }
.	 { return OTHER; }

%%

int yywrap(void){
	return 1;
}
