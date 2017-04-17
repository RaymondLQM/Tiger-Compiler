#include "absyn.h"
#include "util.h"
#include <stdio.h>
A_exp A_IntExp(int i){
	A_exp p = (A_exp)checked_malloc(sizeof(*p));
	p->kind = A_intExp;
	p->u.intt = i;
	return p;
}
A_exp A_OpExp(A_oper oper, A_exp left, A_exp right){
	A_exp p = (A_exp)checked_malloc(sizeof(*p));
	p->kind = A_opExp;
	p->u.op.oper = oper;
	p->u.op.left = left;
	p->u.op.right = right;
	return p;
}
A_exp A_LetExp(A_decList decs, A_exp body){
	A_exp p = (A_exp)checked_malloc(sizeof(*p));
	p->kind = A_letExp;
	p->u.let.decs = decs;
	p->u.let.body = body;
	return p;
}

A_dec A_Dec(){
	A_dec p = NULL;
	return p;
}
A_decList A_DecList(A_dec head, A_decList tail){
	A_decList p = (A_decList)checked_malloc(sizeof(*p));
	p->head = head;
	p->tail = tail;
	return p;
} 
void showTree(A_exp root){
	if(root->kind != 2)printf("Error in Let\n");
	else{
		A_decList tmp1 = root->u.let.decs;
		A_exp tmp2 = root->u.let.body;
		if(tmp1->head != NULL | tmp1->tail != NULL)
			printf("Error in Dec\n");
		if(tmp2->kind != 1)printf("Error in Op\n");
		else {
			A_exp tmpleft = tmp2->u.op.left;
			A_exp tmpright = tmp2->u.op.right;
			if(tmpleft->kind != 0 || tmpleft->kind != 0)
				printf("Error in Int\n");
			else {
				printf("%d\n", tmpleft->u.intt);
				printf("%d\n", tmpright->u.intt);
			}
		}
	}
}