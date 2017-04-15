/*
typedef char *string;
typedef struct A_program *A_program;
typedef struct A_exp *A_exp;
typedef struct A_leftValue *A_leftValue;
typedef struct A_expList *A_expList;
typedef struct A_expSequence *A_expSequence;
typedef struct A_fieldList *A_fieldList;
typedef struct A_decs *A_decs;
typedef struct A_dec *A_dec;
typedef struct A_typeDec *A_typeDec;
typedef struct A_type *A_type;
typedef struct A_typeFields *A_typeFields;
typedef struct A_varDec A_varDec;
typedef struct A_functionDec *A_functionDec;
typedef enum { A_plusOP, A_minusOP, A_timeOP, A_divideOp,
			   A_eqOp, A_neqOp, A_ltOp, A_leOp, A_gtOp, A_geOp } A_oper;
typedef struct A_var *A_var;
struct A_var{
	enum { A_simpleVar, A_fieldVar, A_subscriptVar } kind;
	union { 
		S_symbol simple;
		struct {
			A_var var;
			S_symbol sym;
		} field;
		struct {
			A_var var;
			A_exp exp;
		} subscript;
	} u;
};
A_var A_SimpleVar(S_symbol sym);
A_var A_FieldVar(A_var var, A_exp exp);
A_var A_Subscript(A_var var, A_exp exp);

struct A_exp{
	enum { A_varExp, A_nilExp, A_intExp, A_stringExp, A_callExp, A_opExp,
		A_recordExp, A_seqExp, A_assignExp, A_ifExp, A_whileExp, A_breakExp,
	 	A_forExp, A_letExp, A_arrayExp } kind;
	union {
		A_var var;
		struct {

		} Nil;
		int i;
		string s;
		struct {
			S_symbol func;
			A_expList args;
		} call;
		struct {
			A_oper oper;
			A_exp left;
			A_exp right;
		} op;
		struct {
			S_symbol type;
			A_efieldList fields;
		} record;
		struct {
			A_expList seq;
		} seq;
		struct {
			A_var var;
			A_exp exp;
		} assign;
		struct {
			A_exp test;
			A_exp then;
			A_exp elsee;
		} ifExp;
		struct {
			A_exp test;
			A_exp body;
		} whileExp;
		struct {

		} breakExp;
		struct {
			S_symbol var;
			A_exp lo;
			A_exp hi;
			A_exp body
		} forExp;
		struct {
			A_decList decs;
			A_exp body;
		} letExp;
		struct {
			S_symbol type;
			A_exp size;
			A_exp init;
		} arrayExp;
	} u;
};
A_exp A_VarExp(A_var var);
A_exp A_NilExp();
A_exp A_IntExp(int i);
A_exp A_StringExp(string s);
A_exp A_CallExp(S_symbol func, A_expList args);
A_exp A_OpExp(A_oper oper, A_exp left, A_exp right);
A_exp A_RecordExp(S_symbol type, A_efieldList fields);
A_exp A_SeqExp(A_expList seq);
A_exp A_AssignExp(A_var var, A_exp exp);
A_exp A_IfExp(A_exp test, A_exp then, A_exp elsee);
A_exp A_WhileExp(A_exp test, A_exp body);
A_exp A_BreakExp();
A_exp A_ForExp(S_symbol var, A_exp lo, A_exp hi, A_exp body);
A_exp A_LetExp(A_decList decs, A_exp body);
A_exp A_ArrayExp(S_symbol type, A_exp size, A_exp init);
struct A_dec{
	enum {A_functionDec, A_varDec, A_typeDec } kind;
	union {
		A_fundecList function;
		struct {
			S_symbol var;
			S_symbol type;
			A_exp init;
		} var;
		A_nameTypeList type;
	} u;
};
A_dec A_FunctionDec(A_fundecList function);
A_dec A_VarDec(S_symbol var, S_symbol type, A_exp init);
A_dec A_TypeDec(A_nameTypeList type);
struct A_type{
	enum { A_nameType, A_recordType, A_arrayType } kind;
	union{
		S_symbol name;
		A_fieldList record;
		S_symbol array;
	} u;
};
A_type A_NameType(S_symbol name);
A_type A_RecordType(A_fieldList record);
A_type A_ArrayType(S_symbol array);
struct A_field{
	enum { A_field } kind;
	union {
		struct {
			S_symbol name;
			S_symbol type;
		} field;
	} u;
};
A_field A_Field(S_symbol name, S_symbol type);
struct A_fieldList{
	enum { A_fieldList } kind;
	union {
		struct {
			A_field head;
			A_fieldList tail;
		} fieldList;
	} u;
};
A_fieldList A_FieldList(A_field head, A_fieldList tail);
struct A_expList{
	enum { A_expList } kind;
	union {
		struct {
			A_exp head;
			A_expList tail;
		} expList;
	} u;
};
A_expList A_ExpList(A_exp head, A_expList tail);
struct A_functionDec{
	enum { A_functionDec } kind;
	union {
		struct {
			S_symbol name;
			A_fieldList params;
			S_symbol result;
			A_exp body;
		} functionDec;
	} u;
};
A_functionDec A_FunctionDec(S_symbol name, A_fieldList params, S_symbol result, A_exp body);
struct A_functionDecList{
	enum { A_functionDecList } kind;
	union {
		struct {
			A_functionDec head;
			A_functionDecList tail;
		} functionDecList;
	} u;
};
A_functionDecList A_FunctionDecList(A_fundec head, A_fundecList tail);
struct A_decList{
	enum { A_decList } kind;
	union {
		struct {
			A_dec head;
			A_decList tail;
		} decList;
	} u;
};
A_decList A_DecList(A_dec head, A_decList tail);
struct A_nameType{
	enum { A_nameType } kind;
	union {
		struct {
			S_symbol name;
			A_type type;
		} nameType;
	} u;
};
A_nameType A_NameType(S_symbol name, A_type type);
struct A_{
	enum { A_nameTypeList } kind;
	union {
		struct {
			A_nameType head;
			A_nameTypeList tail;
		} nameTypeList;
	} u;
};
A_nameTypeList A_NameTypeList(A_nameType head, A_nameTypeList tail);
struct A_{
	enum { A_efield } kind;
	union {
		struct {
			A_efield head;
			A_efieldList tail;
		} efieldList;
	} u;
};
A_efield A_EfidldList(A_efidld head, A_efieldList tail);
struct A_{
	enum { A_efieldList} kind;
	union {
		struct {
			A_efield head;
			A_efieldList tail;
		} efieldList;
	} u;
};
A_efidldList A_EfieldList(A_efield head, A_efidldList tail);
*/