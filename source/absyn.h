typedef struct A_exp_ *A_exp;
typedef struct A_dec_ *A_dec;
typedef struct A_decList_ *A_decList;
typedef enum { A_plusOP } A_oper;
struct A_exp_{
	enum { A_intExp, A_opExp, A_letExp } kind;
	union {
		int intt;
		struct { A_oper oper; A_exp left; A_exp right; } op;
		struct { A_decList decs; A_exp body; } let;
	} u;
};
A_exp A_IntExp(int i);
A_exp A_OpExp(A_oper oper, A_exp left, A_exp right);
A_exp A_LetExp(A_decList decs, A_exp body);

struct A_dec_{
	enum { test } kind;
	union {
		int test;
	} u;
};

A_dec A_Dec();

struct A_decList_ { A_dec head; A_decList tail; };
A_decList A_DecList(A_dec head, A_decList tail);
void showTree(A_exp root);