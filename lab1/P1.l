	//FLEX FILE P1.l 

%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "P1.tab.h"
void yyerror(char*); 
int yyparse(void); 
%}

%%

"class" 	return CLASS;
"public"	return PUBLIC;
"static"	return STATIC;
"void"		return VOID;
"main"		return MAIN;
"return"	return RETURN;
"int"		return INTEGER_TYPE;
"boolean"	return BOOLEAN_TYPE;
"if"		return IF;
"else"		return ELSE;
"while"		return WHILE;
"true"		return TRUE_LITERAL;
"false"		return FALSE_LITERAL;
"this"		return THIS;
"new"		return NEW;
"extends"	return EXTENDS;
"String"	return STRING;
"System.out.println"	return PRINT_FN;
"."[ ]*"length"	return DOTLENGTH;

"#"[ ]*"define" return DEFINE;

[0-9]+	{
			//printf("Saw an integer %s\n",yytext); 
			// yylval.int_val = atoi(yytext);
			yylval.code = (char*)malloc(sizeof(char)*(strlen(yytext)+1));
			strcpy(yylval.code, yytext);
			return INTEGER_LITERAL; 
		}
"//".*	;
%x IN_COMMENT
<INITIAL>{
	"/*"		BEGIN(IN_COMMENT);
}	
<IN_COMMENT>{
     "*/"      BEGIN(INITIAL);
     [^*\n]+   // eat comment in chunks
     "*"       // eat the lone star
     \n        yylineno++;
}

","		return COMMA;
";"		return SEMICOLON;
"+" 	return PLUS;
"-"		return MINUS;
"*"		return MULT;
"/"		return DIV;
"&&"	return AND;
"||"	return OR;
"!"		return NOT;
"="		return EQUALS;
"<"		return LESS_THAN;
"."		return DOT;
"("		return OPEN_PAREN;
")"		return CLOSED_PAREN;
"["		return OPEN_BOX;
"]"		return CLOSED_BOX;
"{"		return OPEN_CURLY;
"}"		return CLOSED_CURLY;


[a-zA-Z_][a-zA-Z_0-9]*	{
							yylval.code = (char*)malloc(sizeof(char)*(strlen(yytext)+1));
							strcpy(yylval.code, yytext);
							return IDENTIFIER; 
						}

[ \t\n\r\f ]+		;		//do nothing on whitespace
<<EOF>>		yyterminate(); 
.			{ return 1;}

%%

void yyerror(char* str) { printf("// Failed to parse macrojava code.\n"); }

int yywrap(void) { return 1; }

int main(void) {
	yyparse();	
}
