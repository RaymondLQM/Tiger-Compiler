decs -> dec; decs  
decs ->   
dec -> typedec  
dec -> vardec  
//dec -> fundec  
typedec -> **type** type-id(ID) = type   
type -> type-id(ID)  
type -> { typefiedlds }  
type -> **array of** type-id(ID)  
type -> **int**  
type -> **string**  
typefields ->  
typefields -> id(ID):type-id(ID)  
typefields -> id(ID):type-id(ID), typefields  
vardec -> var id(ID) := exp
vardec -> var id(ID):type-id(ID) := exp
exp -> **int**