/* BISON FILE P1.y */
%{
        #include <stdio.h>
        #include <stdlib.h>
        #include <string.h>
        #include "P1.tab.h"
        extern int yylex();
        extern void yyerror(char *);
        void print(char*);
%}

%union {
	int   int_val;
	char* code;
};

%token <code>  INTEGER_LITERAL

%token <code>  IDENTIFIER

%token <code> PLUS MINUS MULT DIV EQUALS NOT AND OR LESS_THAN DOT OPEN_PAREN OPEN_BOX 
%token <code> CLOSED_BOX OPEN_CURLY CLOSED_CURLY CLASS PUBLIC STATIC VOID MAIN PRINT_FN RETURN INTEGER_TYPE
%token <code> BOOLEAN_TYPE IF WHILE TRUE_LITERAL FALSE_LITERAL THIS NEW DOTLENGTH SEMICOLON COMMA
%token <code> STRING EXTENDS

%precedence <code> CLOSED_PAREN
%precedence <code> ELSE


%start Goal

%%

Goal : MainClass TypeDeclarationList 

MainClass : CLASS IDENTIFIER OPEN_CURLY PUBLIC STATIC VOID MAIN OPEN_PAREN STRING OPEN_BOX CLOSED_BOX IDENTIFIER CLOSED_PAREN OPEN_CURLY PRINT_FN OPEN_PAREN expression CLOSED_PAREN SEMICOLON CLOSED_CURLY CLOSED_CURLY 

TypeDeclarationList : /*empty*/         
                |  TypeDeclarationList TypeDeclaration          

TypeDeclaration : CLASS IDENTIFIER OPEN_CURLY variable_declaration_list method_declaration_list CLOSED_CURLY 
                | CLASS IDENTIFIER EXTENDS IDENTIFIER OPEN_CURLY variable_declaration_list method_declaration_list CLOSED_CURLY 

variable_declaration : TYPE IDENTIFIER 

variable_declaration_list : /*empty*/  
                | variable_declaration_list variable_declaration SEMICOLON 

argument_list : /*empty*/       
                | variable_declaration extra_arguments  

extra_arguments : /*empty*/     
                | extra_arguments COMMA variable_declaration 

method_declaration_list : /*empty*/ 
                | method_declaration_list method_declaration    

method_content : /*empty*/      
                | INBUILT_TYPE IDENTIFIER SEMICOLON method_content      
                | IDENTIFIER follows_identifier_in_method       
                | other_statement statement_list        

follows_identifier_in_method : follows_identifier_in_statement statement_list   
                | IDENTIFIER SEMICOLON method_content   

method_declaration : PUBLIC TYPE IDENTIFIER OPEN_PAREN argument_list CLOSED_PAREN OPEN_CURLY method_content RETURN expression SEMICOLON CLOSED_CURLY    

INBUILT_TYPE : INTEGER_TYPE OPEN_BOX CLOSED_BOX 
                | INTEGER_TYPE                  
                | BOOLEAN_TYPE                  

TYPE : INBUILT_TYPE                             
                | IDENTIFIER                    

statement_list : /*empty*/                      
                | statement_list statement      

other_statement : PRINT_FN OPEN_PAREN expression CLOSED_PAREN SEMICOLON        
                | WHILE OPEN_PAREN expression CLOSED_PAREN statement    
                | IF OPEN_PAREN expression CLOSED_PAREN statement ELSE statement        
                | IF OPEN_PAREN expression CLOSED_PAREN statement       

follows_identifier_in_statement : EQUALS expression SEMICOLON   
                | OPEN_BOX expression CLOSED_BOX EQUALS expression SEMICOLON    

statement : OPEN_CURLY statement_list CLOSED_CURLY              
                | IDENTIFIER follows_identifier_in_statement            
                | other_statement       

function_call : IDENTIFIER OPEN_PAREN parameter_list CLOSED_PAREN 

parameter_list : /*empty*/      
                | expression extra_parameter_list       

extra_parameter_list : /*empty*/                
                | extra_parameter_list COMMA expression         

expression : prim_exp follows_primexp   

follows_primexp : AND prim_exp          
                | OR prim_exp           
                | NOT EQUALS prim_exp   
                | LESS_THAN EQUALS prim_exp 
                | PLUS prim_exp         
                | MINUS prim_exp        
                | MULT prim_exp         
                | DIV prim_exp          
                | OPEN_BOX prim_exp CLOSED_BOX 
                | DOTLENGTH             
                | /*empty*/             
                | DOT function_call     

prim_exp : INTEGER_LITERAL              
                | TRUE_LITERAL          
                | FALSE_LITERAL         
                | IDENTIFIER            
                | THIS                  
                | NEW INTEGER_TYPE OPEN_BOX expression CLOSED_BOX 
                | NEW IDENTIFIER OPEN_PAREN CLOSED_PAREN 
                | NOT expression 
                | OPEN_PAREN expression CLOSED_PAREN 


%%

void print(char* x) {
	printf("%s\n",x);
}
