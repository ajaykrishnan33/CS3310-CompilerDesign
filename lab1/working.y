/* BISON FILE P1.y */

%code requires {
        struct macro_arg{
                char *code;
        };
        struct macro_arg_list{
                struct macro_arg args[100];
                int count;
        };
}

%{
        #include <stdio.h>
        #include <stdlib.h>
        #include <string.h>
        #include "P1.tab.h"
        extern int yylex();
        extern void yyerror(char *);
        void print(char*);
        int getMacroIndex(char*);
        void fillPos(int);

        char* replaceParams(int, struct macro_arg_list);

        struct pos_table {
                int arg_index;
                int str_index;
                int end_index;
        };
        struct Macro {
                char identifier[100];
                struct macro_arg_list arglist;
                char replace_with[400];
                struct pos_table pos[400];
                int pos_count;
        };

        struct Macro *mac_table;
        int mac_count;

        int cmpfunc(const void *a, const void *b){
                return ((struct pos_table*)a)->str_index - ((struct pos_table*)b)->str_index;
        }

        void fillPos(int index){
                char* p;
                char* max = mac_table[index].replace_with + strlen(mac_table[index].replace_with);
                int i, j=0, num;
                int flag = 1;
                struct pos_table elem;
                for(i=0;i<mac_table[index].arglist.count;i++){
                        flag = 1;
                        p = mac_table[index].replace_with;
                        while(p<max){
                                flag = 1;
                                // printf("%s\n %s\n\n", p, mac_table[index].arglist.args[i].code);
                                p = strstr(p, mac_table[index].arglist.args[i].code);
                                if(p==NULL)
                                        break;
                                num = (int)(p - mac_table[index].replace_with);
                                switch(*(p-1)){
                                        case ' ':
                                        case ';':
                                        case ',':
                                        case '}':
                                        case '[':
                                        case '{':
                                        case ']':
                                        case '(':
                                        case ')':
                                        case '+':
                                        case '-':
                                        case '*':
                                        case '/':
                                        case '<':
                                        case '=':
                                        case '!':
                                        case '&':
                                        case '|':
                                        case '.':
                                        case '\n':
                                        case '\t':
                                        break;
                                        default:
                                        flag = 0;
                                        break;
                                }
                                // printf("After first switch\n");
                                if(flag==0){
                                        p = p+1;
                                        continue;
                                }
                                switch(*(p+strlen(mac_table[index].arglist.args[i].code))){
                                        case ' ':
                                        case ';':
                                        case ',':
                                        case '}':
                                        case '[':
                                        case '{':
                                        case ']':
                                        case '(':
                                        case ')':
                                        case '+':
                                        case '-':
                                        case '*':
                                        case '/':
                                        case '<':
                                        case '=':
                                        case '!':
                                        case '&':
                                        case '|':
                                        case '.':
                                        case '\n':
                                        case '\t':
                                        break;
                                        default:
                                        flag = 0;
                                        break;
                                }
                                // printf("After second switch\n");
                                if(flag==0){
                                        // printf("In flag check\n");
                                        p = p+1;
                                        continue;
                                }

                                elem.arg_index = i;
                                elem.str_index = num;
                                elem.end_index = num + strlen(mac_table[index].arglist.args[i].code);
                                mac_table[index].pos[j++] = elem;
                                p = p+1;
                        }
                }
                // printf("j:%d\n", j);
                mac_table[index].pos_count = j;
                qsort(mac_table[index].pos, j, sizeof(struct pos_table), cmpfunc);
        }

        char* replaceParams(int index, struct macro_arg_list paramlist){
                int i, prev = 0;
                char *ret = (char*)malloc(sizeof(char)*100*strlen(mac_table[index].replace_with));
                ret[0] = '\0';
                for(i=0;i<mac_table[index].pos_count;i++){
                        strncat(ret, mac_table[index].replace_with + prev, mac_table[index].pos[i].str_index - prev);
                        prev = mac_table[index].pos[i].end_index;
                        strcat(ret, paramlist.args[mac_table[index].pos[i].arg_index].code);
                }
                if(prev<strlen(mac_table[index].replace_with)){
                        strcat(ret, mac_table[index].replace_with + prev);
                }
                return ret;
        }

        int getMacroIndex(char* name){
                int i;
                for(i=mac_count-1;i>=0;i--){
                        if(strcmp(mac_table[i].identifier, name)==0){
                                return i;
                        }
                }
                return -1;
        }

%}
%initial-action{
        mac_table = (struct Macro *)calloc(100, sizeof(struct Macro));
        mac_count = 0;
}

%union {
	int   int_val;
	char* code;
        struct macro_arg_list arglist;
};

%token <code>  INTEGER_LITERAL

%token <code>  IDENTIFIER

%token <code> PLUS MINUS MULT DIV EQUALS NOT AND OR LESS_THAN DOT OPEN_PAREN OPEN_BOX 
%token <code> CLOSED_BOX OPEN_CURLY CLOSED_CURLY CLASS PUBLIC STATIC VOID MAIN PRINT_FN RETURN INTEGER_TYPE
%token <code> BOOLEAN_TYPE IF WHILE TRUE_LITERAL FALSE_LITERAL THIS NEW DOTLENGTH DEFINE SEMICOLON COMMA
%token <code> STRING EXTENDS

%type <arglist> macro_param_list
%type <arglist> macro_extra_param_list
%type <arglist> macro_arg_list
%type <arglist> macro_extra_arg_list
%type <code> prim_exp
%type <code> follows_primexp
%type <code> expression
%type <code> extra_parameter_list
%type <code> parameter_list
%type <code> macro_expression_call
%type <code> statement
%type <code> follows_identifier_in_statement
%type <code> other_statement
%type <code> statement_list
%type <code> TYPE
%type <code> INBUILT_TYPE
%type <code> function_call
%type <code> follows_identifier_in_method
%type <code> method_content
%type <code> method_declaration
%type <code> method_declaration_list
%type <code> extra_arguments
%type <code> argument_list
%type <code> variable_declaration_list
%type <code> variable_declaration
%type <code> TypeDeclaration
%type <code> TypeDeclarationList
%type <code> MainClass
%type <code> Goal

%precedence <code> CLOSED_PAREN
%precedence <code> ELSE


%start Goal

%%

Goal : MacroDefinitionList MainClass TypeDeclarationList {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+strlen($3)+10));
        $$[0] = '\0';
        strcat($$, $2);
        strcat($$, "\n");
        strcat($$, $3);
        strcat($$, "\n");
        free($2);
        free($3);
        print($$);
}

MainClass : CLASS IDENTIFIER OPEN_CURLY PUBLIC STATIC VOID MAIN OPEN_PAREN STRING OPEN_BOX CLOSED_BOX IDENTIFIER CLOSED_PAREN OPEN_CURLY PRINT_FN OPEN_PAREN expression CLOSED_PAREN SEMICOLON CLOSED_CURLY CLOSED_CURLY {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+strlen($12)+strlen($expression)+100));
        $$[0] = '\0';
        strcat($$, "class ");
        strcat($$, $2);
        strcat($$, "{\n\tpublic static void main (String [] ");
        strcat($$, $12);
        strcat($$, ")\n\t{\n\t\tSystem.out.println(");
        strcat($$, $expression);
        strcat($$, ");\n\t}\n}");
        free($2);
        free($12);
        free($expression);
}

TypeDeclarationList : /*empty*/         {
        $$ = (char*)malloc(sizeof(char)*3);
        $$[0] = '\n';
        $$[1] = '\0';
}
                |  TypeDeclarationList TypeDeclaration          {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+10));
        $$[0] = '\0';                        
        strcat($$, $1);
        strcat($$, "\n");
        strcat($$, $2);
        free($1);
        free($2);
}

TypeDeclaration : CLASS IDENTIFIER OPEN_CURLY variable_declaration_list method_declaration_list CLOSED_CURLY {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+strlen($variable_declaration_list)+strlen($method_declaration_list)+30));
        $$[0] = '\0';                        
        strcat($$, "class ");
        strcat($$, $2);
        strcat($$, "{\n\t");
        strcat($$, $variable_declaration_list);
        strcat($$, $method_declaration_list);
        strcat($$, "\n}");
        free($2);
        free($variable_declaration_list);
        free($method_declaration_list);
}
                | CLASS IDENTIFIER EXTENDS IDENTIFIER OPEN_CURLY variable_declaration_list method_declaration_list CLOSED_CURLY {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+strlen($4)+strlen($variable_declaration_list)+strlen($method_declaration_list)+30));
        $$[0] = '\0';                        
        strcat($$, "class ");
        strcat($$, $2);
        strcat($$, " extends ");
        strcat($$, $4);
        strcat($$, "{\n\t");
        strcat($$, $variable_declaration_list);
        strcat($$, $method_declaration_list);
        strcat($$, "\n}");
        free($2);
        free($4);
        free($variable_declaration_list);
        free($method_declaration_list);
}

variable_declaration : TYPE IDENTIFIER {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+10));
        $$[0] = '\0';                     
        strcat($$, $1);
        strcat($$, " ");
        strcat($$, $2);
        free($1);
        free($2);
}

variable_declaration_list : /*empty*/  {
        $$ = (char*)malloc(sizeof(char)*3);
        $$[0] = '\0';                        
}
                | variable_declaration_list variable_declaration SEMICOLON {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+10));
        $$[0] = '\0';        
        strcat($$, $1);
        strcat($$, "\n");
        strcat($$, $2);
        strcat($$, ";");
        free($1);
        free($2);
}

argument_list : /*empty*/       {
        $$ = (char*)malloc(sizeof(char)*3);
        $$[0] = '\0';                        
} 
                | variable_declaration extra_arguments  {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+10));
        $$[0] = '\0';                        
        strcat($$, $1);
        strcat($$, $2);
        free($1);
        free($2);
}

extra_arguments : /*empty*/     {
        $$ = (char*)malloc(sizeof(char)*3);
        $$[0] = '\0';                        
}
                | extra_arguments COMMA variable_declaration {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($3)+10));
        $$[0] = '\0';                        
        strcat($$, $1);
        strcat($$, ",");
        strcat($$, $3);
        free($1);
        free($3);
}

method_declaration_list : /*empty*/ {
        $$ = (char*)malloc(sizeof(char)*3);
        $$[0] = '\0';                        
        strcat($$, "\n");
}
                | method_declaration_list method_declaration    {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+10));
        $$[0] = '\0';  
        strcat($$, $1);
        strcat($$, "\n");
        strcat($$, $2);
        free($1);
        free($2);
}

method_content : /*empty*/      {
        $$ = (char*)malloc(sizeof(char)*3);
        $$[0] = '\0';                        
        strcat($$, "\n");
}
                | INBUILT_TYPE IDENTIFIER SEMICOLON method_content      {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+strlen($4)+10));
        $$[0] = '\0';                        
        strcat($$, $1);
        strcat($$, " ");
        strcat($$, $2);
        strcat($$, "; ");
        strcat($$, $4);
        free($1);
        free($2);
        free($4);
}
                | IDENTIFIER follows_identifier_in_method       {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+10));
        $$[0] = '\0';                     
        strcat($$, $1);
        strcat($$, " ");
        strcat($$, $2);
        free($1);
        free($2);
}
                | other_statement statement_list        {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+10));
        $$[0] = '\0';                        
        strcat($$, $1);
        strcat($$, "\n");
        strcat($$, $2);
        free($1);
        free($2);
}

follows_identifier_in_method : follows_identifier_in_statement statement_list   {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+10));
        $$[0] = '\0';                        
        strcat($$, $1);
        strcat($$, " ");
        strcat($$, $2);
        free($1);
        free($2);
}
                | IDENTIFIER SEMICOLON method_content   {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($3)+10));
        $$[0] = '\0';           
        strcat($$, $1);
        strcat($$, ";\n");
        strcat($$, $3);
        free($1);
        free($3);
}

method_declaration : PUBLIC TYPE IDENTIFIER OPEN_PAREN argument_list CLOSED_PAREN OPEN_CURLY method_content RETURN expression SEMICOLON CLOSED_CURLY    {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+strlen($3)+strlen($argument_list)+strlen($method_content)+strlen($expression)+30));
        $$[0] = '\0';
        strcat($$, "public ");
        strcat($$, $2);
        strcat($$, " ");
        strcat($$, $3);
        strcat($$, "(");
        strcat($$, $argument_list);
        strcat($$, "){\n");
        strcat($$, $method_content);
        strcat($$, "return ");
        strcat($$, $expression);
        strcat($$, ";\n\t}");
        free($2);
        free($3);
        free($argument_list);
        free($method_content);
        free($expression);
}

INBUILT_TYPE : INTEGER_TYPE OPEN_BOX CLOSED_BOX {
        $$ = (char*)malloc(sizeof(char)*10);
        $$[0] = '\0';
        strcat($$, "int []");
}
                | INTEGER_TYPE                  {
        $$ = (char*)malloc(sizeof(char)*10);
        $$[0] = '\0';  
        strcat($$, "int");
}
                | BOOLEAN_TYPE                  {
        $$ = (char*)malloc(sizeof(char)*10);
        $$[0] = '\0';
        strcat($$, "boolean");                        
}

TYPE : INBUILT_TYPE                             {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+10));
        $$[0] = '\0';
        strcat($$, $1);
        free($1);
}
                | IDENTIFIER                    {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+10));
        $$[0] = '\0';
        strcat($$, $1);
        free($1);
}

statement_list : /*empty*/                      {
        $$ = (char*)malloc(sizeof(char)*3);
        $$[0] = '\0';
}
                | statement_list statement      {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+10));
        $$[0] = '\0';
        strcat($$, $1);
        strcat($$, $2);
        free($1);
        free($2);
}

other_statement :  PRINT_FN OPEN_PAREN expression CLOSED_PAREN SEMICOLON        {
        $$ = (char*)malloc(sizeof(char)*(strlen($expression)+40));
        $$[0] = '\0';
        strcat($$, "System.out.println(");
        strcat($$, $expression);
        strcat($$, ");");
        free($expression);
}
                | WHILE OPEN_PAREN expression CLOSED_PAREN statement    {
        $$ = (char*)malloc(sizeof(char)*(strlen($expression)+strlen($statement)+20));
        $$[0] = '\0';
        strcat($$, "while (");
        strcat($$, $expression);
        strcat($$, ") ");
        strcat($$, $statement);
        free($expression);
        free($statement);
}
                | IF OPEN_PAREN expression CLOSED_PAREN statement ELSE statement        {
        $$ = (char*)malloc(sizeof(char)*(strlen($expression)+strlen($5)+strlen($7)+25));
        $$[0] = '\0';
        strcat($$, "if (");
        strcat($$, $expression);
        strcat($$, ") ");
        strcat($$, $5);
        strcat($$, " else ");
        strcat($$, $7);
        strcat($$, "\n");
        free($expression);
        free($5);
        free($7);
}
                | IF OPEN_PAREN expression CLOSED_PAREN statement       {
        $$ = (char*)malloc(sizeof(char)*(strlen($expression)+strlen($statement)+10));
        $$[0] = '\0';
        strcat($$, "if (");
        strcat($$, $expression);
        strcat($$, ") ");
        strcat($$, $statement);
        strcat($$, "\n");
        free($expression);
        free($statement);
}

follows_identifier_in_statement : EQUALS expression SEMICOLON   {
        $$ = (char*)malloc(sizeof(char)*(strlen($expression)+10));
        $$[0] = '\0';
        strcat($$, "=");
        strcat($$, $expression);
        strcat($$, "; ");
        free($expression);
}
                | OPEN_BOX expression CLOSED_BOX EQUALS expression SEMICOLON    {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+strlen($5)+10));
        $$[0] = '\0';
        strcat($$, "[");
        strcat($$, $2);
        strcat($$, "] = ");
        strcat($$, $5);
        strcat($$, "; ");                        
        free($2);
        free($5);
}
//                 | OPEN_PAREN parameter_list CLOSED_PAREN SEMICOLON      {
//         $$ = (char*)malloc(sizeof(char)*(strlen($parameter_list)+10));
//         $$[0] = '\0';
//         strcat($$, "(");
//         strcat($$, $parameter_list);
//         strcat($$, "); ");                        
//         free($parameter_list);
// }

statement : OPEN_CURLY statement_list CLOSED_CURLY              {
        $$ = (char*)malloc(sizeof(char)*(strlen($statement_list)+10));
        $$[0] = '\0';
        strcat($$, "{ ");
        strcat($$, $statement_list);
        strcat($$, " } ");
        free($statement_list);
}
                | macro_expression_call SEMICOLON       {
        $$ = $1;
}
                | IDENTIFIER follows_identifier_in_statement            {
        $$ = (char*)malloc(sizeof(char)*(strlen($IDENTIFIER)+strlen($follows_identifier_in_statement)+10));
        $$[0] = '\0';
        strcat($$, $IDENTIFIER);
        strcat($$, $follows_identifier_in_statement);                        
        strcat($$, " ");
        free($IDENTIFIER);
        free($follows_identifier_in_statement);
}
                | other_statement       {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+10));
        $$[0] = '\0';
        strcat($$, $1);                
        free($1);
}

macro_expression_call : IDENTIFIER OPEN_PAREN macro_param_list CLOSED_PAREN {
        // Do something hi-funda here

        int index = getMacroIndex($IDENTIFIER);
        if(index<0){
                yyerror("Parsing error");
                return;
        }
        if(mac_table[index].arglist.count != $macro_param_list.count){
                yyerror("Parsing error");
                return;
        }
        // int i;
        // for(i=0;i<$macro_param_list.count;i++){
        //         printf("%s\n", $macro_param_list.args[i].code);
        // }
        char* res = replaceParams(index, $macro_param_list);
        $$ = res;
        free($IDENTIFIER);
}

function_call : IDENTIFIER OPEN_PAREN parameter_list CLOSED_PAREN {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($3)+10));
        $$[0] = '\0';
        strcat($$, $1);
        strcat($$, "(");
        strcat($$, $3);
        strcat($$, ")");
        free($1);
        free($3);
}

parameter_list : /*empty*/      {
        $$ = (char*)malloc(sizeof(char)*3);
        $$[0] = '\0';
}
                | expression extra_parameter_list       {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+10));
        $$[0] = '\0';
        strcat($$, $1);
        strcat($$, $2);
        free($1);
        free($2);                        
}

extra_parameter_list : /*empty*/                {
        $$ = (char*)malloc(sizeof(char)*3);
        $$[0] = '\0';
}
                | extra_parameter_list COMMA expression         {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($3)+10));
        $$[0] = '\0';
        strcat($$, $1);
        strcat($$, ",");
        strcat($$, $3);                        
        free($1);
        free($3);
}

expression : prim_exp follows_primexp   {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+10));
        $$[0] = '\0';
        strcat($$, $1);
        if(strlen($2)>0){
            strcat($$, $2);        
        }
        
        free($1);
        free($2);
}
                | macro_expression_call         {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+10));
        $$[0] = '\0';
        strcat($$, $1);
        free($1);
}               

follows_primexp : AND prim_exp          {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+10));
        $$[0] = '\0';
        strcat($$, "&&");
        strcat($$, $2);
        free($2);
}
                | OR prim_exp           {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+10));
        $$[0] = '\0';
        strcat($$, "||");
        strcat($$, $2);
        free($2);
}
                | NOT EQUALS prim_exp   {
        $$ = (char*)malloc(sizeof(char)*(strlen($3)+10));
        $$[0] = '\0';
        strcat($$, "!=");
        strcat($$, $3);
        free($3);
}
                | LESS_THAN EQUALS prim_exp {
        $$ = (char*)malloc(sizeof(char)*(strlen($3)+10));
        $$[0] = '\0';
        strcat($$, "<=");
        strcat($$, $3);
        free($3);
}
                | PLUS prim_exp         {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+10));
        $$[0] = '\0';
        strcat($$, "+");
        strcat($$, $2);
        free($2);
}
                | MINUS prim_exp        {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+10));
        $$[0] = '\0';
        strcat($$, "-");
        strcat($$, $2);
        free($2);
}
                | MULT prim_exp         {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+10));
        $$[0] = '\0';
        strcat($$, "*");
        strcat($$, $2);
        free($2);
}
                | DIV prim_exp          {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+10));
        $$[0] = '\0';
        strcat($$, "/");
        strcat($$, $2);
        free($2);
}
                | OPEN_BOX prim_exp CLOSED_BOX {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+10));
        $$[0] = '\0';
        strcat($$, "[");
        strcat($$, $2);
        strcat($$, "]");
        free($2);
}
                | DOTLENGTH             {
        $$ = (char*)malloc(sizeof(char)*9);
        $$[0] = '\0';
        strcat($$, ".length");
}
                | /*empty*/             {
        $$ = (char*)malloc(sizeof(char)*3);
        $$[0] = '\0';
}
                | DOT function_call     {
        $$ = (char*)malloc(sizeof(char)*(strlen($2)+10));
        $$[0] = '\0';
        strcat($$, ".");
        strcat($$, $2);
        free($2);
}

prim_exp : INTEGER_LITERAL              {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+10));
        $$[0] = '\0';
        strcat($$, $1);
        free($1);
}
                | TRUE_LITERAL          {
        $$ = (char*)malloc(sizeof(char)*7);
        $$[0] = '\0';
        strcat($$, "true");
}
                | FALSE_LITERAL         {
        $$ = (char*)malloc(sizeof(char)*7);
        $$[0] = '\0';
        strcat($$, "false");
}
                | IDENTIFIER            {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+10));
        $$[0] = '\0';
        strcat($$, $1);
        free($1);
}
                | THIS                  {
        $$ = (char*)malloc(sizeof(char)*7);
        $$[0] = '\0';
        strcat($$, "this");
}
                | NEW INTEGER_TYPE OPEN_BOX expression CLOSED_BOX {
        $$ = (char*)malloc(sizeof(char)*(strlen($expression)+20));
        $$[0] = '\0';
        strcat($$, "new int [");
        strcat($$, $expression);
        strcat($$, "]");
        free($expression);
}
                | NEW IDENTIFIER OPEN_PAREN CLOSED_PAREN {
        $$ = (char*)malloc(sizeof(char)*(strlen($IDENTIFIER)+10));
        $$[0] = '\0';
        strcat($$, "new ");
        strcat($$, $IDENTIFIER);
        strcat($$, "()");
        free($IDENTIFIER);
}
                | NOT expression {
        $$ = (char*)malloc(sizeof(char)*(strlen($expression)+10));
        $$[0] = '\0';
        strcat($$, "!");
        strcat($$, $expression);
        free($expression);
}
                | OPEN_PAREN expression CLOSED_PAREN {
        $$ = (char*)malloc(sizeof(char)*(strlen($expression)+10));
        $$[0] = '\0';
        strcat($$, "(");
        strcat($$, $expression);
        strcat($$, ")");
        free($expression);
}

macro_param_list : /*empty*/      {
        struct macro_arg_list x;
        x.count = 0;
        $$ = x;
}
                | expression macro_extra_param_list       {
        struct macro_arg m ;
        m.code = (char*)malloc(sizeof(char)*(strlen($1)+5));
        strcpy(m.code, $1);
        struct macro_arg_list x;
        x.args[0] = m;
        x.count = 1;
        memcpy(&(x.args[1]), $2.args, sizeof(struct macro_arg)*$2.count);
        x.count += $2.count;
        $$ = x;
        free($1);
}

macro_extra_param_list : /*empty*/                {
        struct macro_arg_list x;
        x.count = 0;
        $$ = x;
}
                | macro_extra_param_list COMMA expression         {
        
        struct macro_arg m ;
        m.code = (char*)malloc(sizeof(char)*(strlen($3)+5));
        strcpy(m.code, $3);
        $1.args[$1.count++] = m;
        $$ = $1;
        free($3);

}

MacroDefinitionList : /*empty*/ 
                | MacroDefinitionList MacroDefinition  

MacroDefinition : MacroDefExpression            
                | MacroDefStatement             

macro_arg_list : /*empty*/      {
        struct macro_arg_list x;
        x.count = 0;
        $$ = x;
}
                | IDENTIFIER macro_extra_arg_list       {
        struct macro_arg m ;
        m.code = (char*)malloc(sizeof(char)*(strlen($1)+5));
        strcpy(m.code, $1);
        struct macro_arg_list x;
        x.args[0] = m;
        x.count = 1;
        memcpy(&(x.args[1]), $2.args, sizeof(struct macro_arg)*$2.count);
        x.count += $2.count;
        $$ = x;
        free($1);
}

macro_extra_arg_list : /*empty*/                {
        struct macro_arg_list x;
        x.count = 0;
        $$ = x;
}
                | macro_extra_arg_list COMMA IDENTIFIER         {
        
        struct macro_arg m ;
        m.code = (char*)malloc(sizeof(char)*(strlen($3)+5));
        strcpy(m.code, $3);
        $1.args[$1.count++] = m;
        $$ = $1;
        free($3);

}

MacroDefStatement : DEFINE IDENTIFIER OPEN_PAREN macro_arg_list CLOSED_PAREN OPEN_CURLY statement_list CLOSED_CURLY {
        struct Macro m;
        strcpy(m.identifier, $IDENTIFIER);
        free($IDENTIFIER);
        strcpy(m.replace_with, $statement_list);
        m.arglist = $macro_arg_list;
        mac_table[mac_count++] = m;
        fillPos(mac_count-1);
        // int i, index = mac_count-1;
        // for(i=0;i<mac_table[index].pos_count;i++){
        //         printf("arg_index:%d    str_index:%d\n", mac_table[index].pos[i].arg_index, mac_table[index].pos[i].str_index);
        // }
        free($statement_list);
}

MacroDefExpression : DEFINE IDENTIFIER OPEN_PAREN macro_arg_list CLOSED_PAREN OPEN_PAREN expression CLOSED_PAREN    {
        struct Macro m;
        strcpy(m.identifier, $IDENTIFIER);
        free($IDENTIFIER);
        strcpy(m.replace_with, "(");
        strcat(m.replace_with, $expression);
        strcat(m.replace_with, ")");
        m.arglist = $macro_arg_list;
        mac_table[mac_count++] = m;
        fillPos(mac_count-1);
        // int i, index = mac_count-1;
        // for(i=0;i<mac_table[index].pos_count;i++){
        //         printf("arg_index:%d    str_index:%d\n", mac_table[index].pos[i].arg_index, mac_table[index].pos[i].str_index);
        // }
        free($expression);
}


%%

void print(char* x) {
	printf("%s\n",x);
}
