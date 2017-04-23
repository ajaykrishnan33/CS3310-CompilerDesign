/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 13 "P1.y" /* yacc.c:339  */

        #include <stdio.h>
        #include <stdlib.h>
        #include <string.h>
        #include "P1.tab.h"
        extern int yylex();
        extern void yyerror(char* str);
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
                int type; // 0 --> expression ; 1 --> statement
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


#line 221 "P1.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "P1.tab.h".  */
#ifndef YY_YY_P1_TAB_H_INCLUDED
# define YY_YY_P1_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 3 "P1.y" /* yacc.c:355  */

        struct macro_arg{
                char *code;
        };
        struct macro_arg_list{
                struct macro_arg args[100];
                int count;
        };

#line 261 "P1.tab.c" /* yacc.c:355  */

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INTEGER_LITERAL = 258,
    IDENTIFIER = 259,
    PLUS = 260,
    MINUS = 261,
    MULT = 262,
    DIV = 263,
    EQUALS = 264,
    NOT = 265,
    AND = 266,
    OR = 267,
    LESS_THAN = 268,
    DOT = 269,
    OPEN_PAREN = 270,
    OPEN_BOX = 271,
    CLOSED_BOX = 272,
    OPEN_CURLY = 273,
    CLOSED_CURLY = 274,
    CLASS = 275,
    PUBLIC = 276,
    STATIC = 277,
    VOID = 278,
    MAIN = 279,
    PRINT_FN = 280,
    RETURN = 281,
    INTEGER_TYPE = 282,
    BOOLEAN_TYPE = 283,
    IF = 284,
    WHILE = 285,
    TRUE_LITERAL = 286,
    FALSE_LITERAL = 287,
    THIS = 288,
    NEW = 289,
    DOTLENGTH = 290,
    DEFINE = 291,
    SEMICOLON = 292,
    COMMA = 293,
    STRING = 294,
    EXTENDS = 295,
    CLOSED_PAREN = 296,
    ELSE = 297
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 172 "P1.y" /* yacc.c:355  */

        int   int_val;
        char* code;
        struct macro_arg_list arglist;

#line 322 "P1.tab.c" /* yacc.c:355  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_P1_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 337 "P1.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   215

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  43
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  35
/* YYNRULES -- Number of rules.  */
#define YYNRULES  84
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  197

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   297

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   226,   226,   238,   253,   258,   268,   281,   298,   308,
     312,   323,   327,   336,   340,   350,   355,   365,   370,   382,
     391,   401,   410,   420,   446,   451,   456,   462,   468,   475,
     479,   488,   496,   506,   520,   532,   540,   552,   560,   563,
     572,   579,   599,   619,   630,   634,   643,   647,   657,   668,
     675,   682,   689,   696,   703,   710,   717,   724,   731,   739,
     744,   748,   756,   762,   767,   772,   778,   783,   791,   799,
     806,   815,   820,   833,   838,   849,   850,   852,   853,   855,
     860,   873,   878,   889,   906
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "INTEGER_LITERAL", "IDENTIFIER", "PLUS",
  "MINUS", "MULT", "DIV", "EQUALS", "NOT", "AND", "OR", "LESS_THAN", "DOT",
  "OPEN_PAREN", "OPEN_BOX", "CLOSED_BOX", "OPEN_CURLY", "CLOSED_CURLY",
  "CLASS", "PUBLIC", "STATIC", "VOID", "MAIN", "PRINT_FN", "RETURN",
  "INTEGER_TYPE", "BOOLEAN_TYPE", "IF", "WHILE", "TRUE_LITERAL",
  "FALSE_LITERAL", "THIS", "NEW", "DOTLENGTH", "DEFINE", "SEMICOLON",
  "COMMA", "STRING", "EXTENDS", "CLOSED_PAREN", "ELSE", "$accept", "Goal",
  "MainClass", "TypeDeclarationList", "TypeDeclaration",
  "variable_declaration", "variable_declaration_list", "argument_list",
  "extra_arguments", "method_declaration_list", "method_content",
  "follows_identifier_in_method", "method_declaration", "INBUILT_TYPE",
  "TYPE", "statement_list", "other_statement",
  "follows_identifier_in_statement", "statement", "macro_statement_call",
  "macro_expression_call", "function_call", "parameter_list",
  "extra_parameter_list", "expression", "follows_primexp", "prim_exp",
  "macro_param_list", "macro_extra_param_list", "MacroDefinitionList",
  "MacroDefinition", "macro_arg_list", "macro_extra_arg_list",
  "MacroDefStatement", "MacroDefExpression", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297
};
# endif

#define YYPACT_NINF -166

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-166)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
    -166,     2,   -14,  -166,    -1,    10,  -166,  -166,  -166,  -166,
      13,     6,    60,    61,    85,   102,  -166,    88,  -166,    71,
      32,    91,    80,    56,  -166,   115,    97,   118,    14,  -166,
       0,   105,   109,  -166,  -166,   111,    14,    14,  -166,  -166,
    -166,     3,  -166,    87,    28,    39,  -166,   113,  -166,    90,
      40,  -166,   126,  -166,    92,    14,  -166,    93,   120,   117,
    -166,    22,    22,    22,    22,   127,    22,    22,   128,   134,
      22,  -166,  -166,    83,  -166,  -166,   124,   125,   129,  -166,
    -166,  -166,   130,  -166,  -166,     0,  -166,  -166,     0,   132,
    -166,   100,  -166,   101,    14,  -166,  -166,  -166,  -166,  -166,
      22,  -166,  -166,    22,   131,  -166,   133,    14,    14,    14,
    -166,    58,    14,    14,    14,  -166,   139,    46,   135,   107,
    -166,  -166,   137,  -166,  -166,    14,  -166,   114,   116,   138,
    -166,   119,   121,   122,   141,  -166,   154,    14,  -166,   123,
    -166,  -166,   136,   150,   140,    86,    86,     0,   142,  -166,
    -166,   143,  -166,    14,  -166,   144,  -166,  -166,   146,   147,
      14,   145,    86,   151,   148,   149,  -166,  -166,  -166,     0,
      66,   152,  -166,   104,   153,   157,  -166,    14,   155,  -166,
    -166,    14,   156,    86,   158,    66,    86,   159,    66,   160,
    -166,   161,  -166,   165,  -166,   166,  -166
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
      75,     0,     0,     1,     0,     0,     4,    76,    78,    77,
       0,     0,     2,     0,    79,     0,     5,     0,    81,     0,
       0,     0,    80,     0,     9,     0,     0,     0,     0,    29,
      15,     0,     0,    82,    62,    65,     0,     0,    63,    64,
      66,     0,    49,     0,    60,     0,    28,    25,    26,     0,
       0,    27,     0,     9,     0,    71,    69,     0,     0,     0,
      84,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    59,    48,     0,    29,    83,     0,     0,     0,    40,
      30,    38,     0,    10,     6,     0,    16,     8,    15,     0,
      73,     0,    70,     0,     0,    65,    54,    55,    56,    57,
       0,    50,    51,     0,     0,    61,     0,     0,    71,     0,
      39,     0,     0,     0,     0,    24,     0,     0,     0,    72,
      42,    68,     0,    52,    53,    44,    58,     0,     0,     0,
      37,     0,     0,     0,     0,     7,     0,     0,    67,     0,
      46,    35,     0,     0,     0,     0,     0,    11,     0,    74,
      43,    45,    41,     0,    31,    34,    32,    13,     0,     0,
       0,     0,     0,    12,     0,     0,    47,    36,    33,     0,
      17,     0,    14,     0,     0,     0,    29,     0,     0,    19,
      29,     0,     0,    20,     0,    17,    21,     0,    17,     0,
      22,     0,    18,     0,    23,     0,     3
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -166,  -166,  -166,  -166,  -166,   -96,   162,  -166,  -166,    81,
     -83,  -166,  -166,  -165,   103,   -73,  -110,    -5,   -45,  -166,
    -166,  -166,  -166,  -166,   -28,  -166,   -51,    62,  -166,  -166,
    -166,  -166,  -166,  -166,  -166
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,     6,    12,    16,    49,    30,   158,   163,    50,
     174,   179,    86,    51,    52,    45,    79,   110,    80,    81,
      42,   105,   139,   151,    90,    72,    44,    91,   119,     2,
       7,    19,    22,     8,     9
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      43,   111,     3,    10,    46,   175,     4,    58,    56,    57,
      96,    97,    98,    99,    11,   101,   102,    34,    35,   106,
     175,    14,     5,   175,    36,    34,    95,    47,    48,    37,
      59,    13,    36,    61,    62,    63,    64,    37,    65,    66,
      67,    68,    69,    73,    70,    38,    39,    40,    41,   123,
      24,   157,   124,    38,    39,    40,    41,    74,    75,    84,
     176,    85,    73,    71,    76,   135,   122,    85,    77,    78,
     173,    28,    25,   172,    29,   176,    74,   130,   176,   127,
      15,   129,    17,    76,   131,   132,   133,    77,    78,    18,
      73,    76,   107,    47,    48,    77,    78,   140,   108,   109,
     155,   156,   190,   183,    74,   192,    20,   186,   178,   149,
      21,    76,    23,   107,    26,    77,    78,   168,    27,    31,
     109,    32,    33,    53,    54,   161,    55,    83,    60,    82,
      87,    89,   166,    94,    92,    93,   100,   103,   104,   112,
     113,   120,   121,   134,   114,   137,   125,   115,   118,   184,
     126,   141,   136,   187,   138,   143,   147,   142,   148,   153,
     144,   182,   145,   146,   150,   165,   170,   177,   180,   117,
     128,     0,     0,   152,   171,     0,     0,   154,     0,   181,
     194,   160,   167,   159,   195,   196,   162,   164,   116,   169,
       0,     0,   185,   188,     0,     0,   191,   193,     0,   189,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    88
};

static const yytype_int16 yycheck[] =
{
      28,    74,     0,     4,     4,   170,    20,     4,    36,    37,
      61,    62,    63,    64,     4,    66,    67,     3,     4,    70,
     185,    15,    36,   188,    10,     3,     4,    27,    28,    15,
      27,    18,    10,     5,     6,     7,     8,    15,    10,    11,
      12,    13,    14,     4,    16,    31,    32,    33,    34,   100,
      18,   147,   103,    31,    32,    33,    34,    18,    19,    19,
     170,    21,     4,    35,    25,    19,    94,    21,    29,    30,
       4,    15,    40,   169,    18,   185,    18,    19,   188,   107,
      20,   109,    21,    25,   112,   113,   114,    29,    30,     4,
       4,    25,     9,    27,    28,    29,    30,   125,    15,    16,
     145,   146,   185,   176,    18,   188,     4,   180,     4,   137,
      22,    25,    41,     9,    23,    29,    30,   162,    38,     4,
      16,    24,     4,    18,    15,   153,    15,    37,    41,    16,
       4,    39,   160,    16,    41,    15,     9,     9,     4,    15,
      15,    41,    41,     4,    15,    38,    15,    17,    16,   177,
      17,    37,    17,   181,    17,    17,    15,    41,     4,     9,
      41,     4,    41,    41,    41,    18,    18,    15,   173,    88,
     108,    -1,    -1,    37,    25,    -1,    -1,    37,    -1,    26,
      19,    38,    37,    41,    19,    19,    42,    41,    85,    38,
      -1,    -1,    37,    37,    -1,    -1,    37,    37,    -1,    41,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    53
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    44,    72,     0,    20,    36,    45,    73,    76,    77,
       4,     4,    46,    18,    15,    20,    47,    21,     4,    74,
       4,    22,    75,    41,    18,    40,    23,    38,    15,    18,
      49,     4,    24,     4,     3,     4,    10,    15,    31,    32,
      33,    34,    63,    67,    69,    58,     4,    27,    28,    48,
      52,    56,    57,    18,    15,    15,    67,    67,     4,    27,
      41,     5,     6,     7,     8,    10,    11,    12,    13,    14,
      16,    35,    68,     4,    18,    19,    25,    29,    30,    59,
      61,    62,    16,    37,    19,    21,    55,     4,    49,    39,
      67,    70,    41,    15,    16,     4,    69,    69,    69,    69,
       9,    69,    69,     9,     4,    64,    69,     9,    15,    16,
      60,    58,    15,    15,    15,    17,    57,    52,    16,    71,
      41,    41,    67,    69,    69,    15,    17,    67,    70,    67,
      19,    67,    67,    67,     4,    19,    17,    38,    17,    65,
      67,    37,    41,    17,    41,    41,    41,    15,     4,    67,
      41,    66,    37,     9,    37,    61,    61,    48,    50,    41,
      38,    67,    42,    51,    41,    18,    67,    37,    61,    38,
      18,    25,    48,     4,    53,    56,    59,    15,     4,    54,
      60,    26,     4,    58,    67,    37,    58,    67,    37,    41,
      53,    37,    53,    37,    19,    19,    19
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    43,    44,    45,    46,    46,    47,    47,    48,    49,
      49,    50,    50,    51,    51,    52,    52,    53,    53,    53,
      53,    54,    54,    55,    56,    56,    56,    57,    57,    58,
      58,    59,    59,    59,    59,    60,    60,    61,    61,    61,
      61,    62,    63,    64,    65,    65,    66,    66,    67,    67,
      68,    68,    68,    68,    68,    68,    68,    68,    68,    68,
      68,    68,    69,    69,    69,    69,    69,    69,    69,    69,
      69,    70,    70,    71,    71,    72,    72,    73,    73,    74,
      74,    75,    75,    76,    77
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,    21,     0,     2,     6,     8,     2,     0,
       3,     0,     2,     0,     3,     0,     2,     0,     4,     2,
       2,     2,     3,    12,     3,     1,     1,     1,     1,     0,
       2,     5,     5,     7,     5,     3,     6,     3,     1,     2,
       1,     5,     4,     4,     0,     2,     0,     3,     2,     1,
       2,     2,     3,     3,     2,     2,     2,     2,     3,     1,
       0,     2,     1,     1,     1,     1,     1,     5,     4,     2,
       3,     0,     2,     0,     3,     0,     2,     1,     1,     0,
       2,     0,     3,     8,     8
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

/* User initialization code.  */
#line 167 "P1.y" /* yacc.c:1429  */
{
        mac_table = (struct Macro *)calloc(1000, sizeof(struct Macro));
        mac_count = 0;
}

#line 1382 "P1.tab.c" /* yacc.c:1429  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 226 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), "\n");
        strcat((yyval.code), (yyvsp[0].code));
        strcat((yyval.code), "\n");
        free((yyvsp[-1].code));
        free((yyvsp[0].code));
        print((yyval.code));
}
#line 1574 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 238 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-19].code))+strlen((yyvsp[-9].code))+strlen((yyvsp[-4].code))+100));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "class ");
        strcat((yyval.code), (yyvsp[-19].code));
        strcat((yyval.code), "{\n\tpublic static void main (String [] ");
        strcat((yyval.code), (yyvsp[-9].code));
        strcat((yyval.code), ")\n\t{\n\t\tSystem.out.println(");
        strcat((yyval.code), (yyvsp[-4].code));
        strcat((yyval.code), ");\n\t}\n}");
        free((yyvsp[-19].code));
        free((yyvsp[-9].code));
        free((yyvsp[-4].code));
}
#line 1593 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 253 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*3);
        (yyval.code)[0] = '\n';
        (yyval.code)[1] = '\0';
}
#line 1603 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 258 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';                        
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), "\n");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[-1].code));
        free((yyvsp[0].code));
}
#line 1617 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 268 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-4].code))+strlen((yyvsp[-2].code))+strlen((yyvsp[-1].code))+30));
        (yyval.code)[0] = '\0';                        
        strcat((yyval.code), "class ");
        strcat((yyval.code), (yyvsp[-4].code));
        strcat((yyval.code), "{\n\t");
        strcat((yyval.code), (yyvsp[-2].code));
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), "\n}");
        free((yyvsp[-4].code));
        free((yyvsp[-2].code));
        free((yyvsp[-1].code));
}
#line 1635 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 281 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-6].code))+strlen((yyvsp[-4].code))+strlen((yyvsp[-2].code))+strlen((yyvsp[-1].code))+30));
        (yyval.code)[0] = '\0';                        
        strcat((yyval.code), "class ");
        strcat((yyval.code), (yyvsp[-6].code));
        strcat((yyval.code), " extends ");
        strcat((yyval.code), (yyvsp[-4].code));
        strcat((yyval.code), "{\n\t");
        strcat((yyval.code), (yyvsp[-2].code));
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), "\n}");
        free((yyvsp[-6].code));
        free((yyvsp[-4].code));
        free((yyvsp[-2].code));
        free((yyvsp[-1].code));
}
#line 1656 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 298 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';                     
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), " ");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[-1].code));
        free((yyvsp[0].code));
}
#line 1670 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 308 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*3);
        (yyval.code)[0] = '\0';                        
}
#line 1679 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 312 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-2].code))+strlen((yyvsp[-1].code))+10));
        (yyval.code)[0] = '\0';        
        strcat((yyval.code), (yyvsp[-2].code));
        strcat((yyval.code), "\n");
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), ";");
        free((yyvsp[-2].code));
        free((yyvsp[-1].code));
}
#line 1694 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 323 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*3);
        (yyval.code)[0] = '\0';                        
}
#line 1703 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 327 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';                        
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[-1].code));
        free((yyvsp[0].code));
}
#line 1716 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 336 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*3);
        (yyval.code)[0] = '\0';                        
}
#line 1725 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 340 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-2].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';                        
        strcat((yyval.code), (yyvsp[-2].code));
        strcat((yyval.code), ",");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[-2].code));
        free((yyvsp[0].code));
}
#line 1739 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 350 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*3);
        (yyval.code)[0] = '\0';                        
        strcat((yyval.code), "\n");
}
#line 1749 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 355 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';  
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), "\n");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[-1].code));
        free((yyvsp[0].code));
}
#line 1763 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 365 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*3);
        (yyval.code)[0] = '\0';                        
        strcat((yyval.code), "\n");
}
#line 1773 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 370 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-3].code))+strlen((yyvsp[-2].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';                        
        strcat((yyval.code), (yyvsp[-3].code));
        strcat((yyval.code), " ");
        strcat((yyval.code), (yyvsp[-2].code));
        strcat((yyval.code), "; ");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[-3].code));
        free((yyvsp[-2].code));
        free((yyvsp[0].code));
}
#line 1790 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 382 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';                     
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), " ");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[-1].code));
        free((yyvsp[0].code));
}
#line 1804 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 391 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';                        
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), "\n");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[-1].code));
        free((yyvsp[0].code));
}
#line 1818 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 401 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';                        
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), " ");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[-1].code));
        free((yyvsp[0].code));
}
#line 1832 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 410 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-2].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';           
        strcat((yyval.code), (yyvsp[-2].code));
        strcat((yyval.code), ";\n");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[-2].code));
        free((yyvsp[0].code));
}
#line 1846 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 420 "P1.y" /* yacc.c:1646  */
    {
        int x = getMacroIndex((yyvsp[-9].code));
        if(x>=0){
                yyerror("// Failed to parse macrojava code.");
                return;
        }
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-10].code))+strlen((yyvsp[-9].code))+strlen((yyvsp[-7].code))+strlen((yyvsp[-4].code))+strlen((yyvsp[-2].code))+30));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "public ");
        strcat((yyval.code), (yyvsp[-10].code));
        strcat((yyval.code), " ");
        strcat((yyval.code), (yyvsp[-9].code));
        strcat((yyval.code), "(");
        strcat((yyval.code), (yyvsp[-7].code));
        strcat((yyval.code), "){\n");
        strcat((yyval.code), (yyvsp[-4].code));
        strcat((yyval.code), "return ");
        strcat((yyval.code), (yyvsp[-2].code));
        strcat((yyval.code), ";\n\t}");
        free((yyvsp[-10].code));
        free((yyvsp[-9].code));
        free((yyvsp[-7].code));
        free((yyvsp[-4].code));
        free((yyvsp[-2].code));
}
#line 1876 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 446 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*10);
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "int []");
}
#line 1886 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 451 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*10);
        (yyval.code)[0] = '\0';  
        strcat((yyval.code), "int");
}
#line 1896 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 456 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*10);
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "boolean");                        
}
#line 1906 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 462 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 1917 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 468 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 1928 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 475 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*3);
        (yyval.code)[0] = '\0';
}
#line 1937 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 479 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[-1].code));
        free((yyvsp[0].code));
}
#line 1950 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 488 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-2].code))+40));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "System.out.println(");
        strcat((yyval.code), (yyvsp[-2].code));
        strcat((yyval.code), ");");
        free((yyvsp[-2].code));
}
#line 1963 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 496 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-2].code))+strlen((yyvsp[0].code))+20));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "while (");
        strcat((yyval.code), (yyvsp[-2].code));
        strcat((yyval.code), ") ");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[-2].code));
        free((yyvsp[0].code));
}
#line 1978 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 506 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-4].code))+strlen((yyvsp[-2].code))+strlen((yyvsp[0].code))+25));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "if (");
        strcat((yyval.code), (yyvsp[-4].code));
        strcat((yyval.code), ") ");
        strcat((yyval.code), (yyvsp[-2].code));
        strcat((yyval.code), " else ");
        strcat((yyval.code), (yyvsp[0].code));
        strcat((yyval.code), "\n");
        free((yyvsp[-4].code));
        free((yyvsp[-2].code));
        free((yyvsp[0].code));
}
#line 1997 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 520 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-2].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "if (");
        strcat((yyval.code), (yyvsp[-2].code));
        strcat((yyval.code), ") ");
        strcat((yyval.code), (yyvsp[0].code));
        strcat((yyval.code), "\n");
        free((yyvsp[-2].code));
        free((yyvsp[0].code));
}
#line 2013 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 532 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "=");
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), "; ");
        free((yyvsp[-1].code));
}
#line 2026 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 540 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-4].code))+strlen((yyvsp[-1].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "[");
        strcat((yyval.code), (yyvsp[-4].code));
        strcat((yyval.code), "] = ");
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), "; ");                        
        free((yyvsp[-4].code));
        free((yyvsp[-1].code));
}
#line 2042 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 552 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "{ ");
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), " } ");
        free((yyvsp[-1].code));
}
#line 2055 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 560 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (yyvsp[0].code);
}
#line 2063 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 563 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), (yyvsp[0].code));                        
        strcat((yyval.code), " ");
        free((yyvsp[-1].code));
        free((yyvsp[0].code));
}
#line 2077 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 572 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), (yyvsp[0].code));                
        free((yyvsp[0].code));
}
#line 2088 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 579 "P1.y" /* yacc.c:1646  */
    {

        int index = getMacroIndex((yyvsp[-4].code));
        if(index<0){
                yyerror("// Failed to parse macrojava code.");
                return;
        }
        if(mac_table[index].type!=1){
                yyerror("// Failed to parse macrojava code.");
                return;
        }
        if(mac_table[index].arglist.count != (yyvsp[-2].arglist).count){
                yyerror("// Failed to parse macrojava code.");
                return;
        }
        char* res = replaceParams(index, (yyvsp[-2].arglist));
        (yyval.code) = res;
        free((yyvsp[-4].code));
}
#line 2112 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 599 "P1.y" /* yacc.c:1646  */
    {

        int index = getMacroIndex((yyvsp[-3].code));
        if(index<0){
                yyerror("// Failed to parse macrojava code.");
                return;
        }
        if(mac_table[index].type!=0){
                yyerror("// Failed to parse macrojava code.");
                return;
        }
        if(mac_table[index].arglist.count != (yyvsp[-1].arglist).count){
                yyerror("// Failed to parse macrojava code.");
                return;
        }
        char* res = replaceParams(index, (yyvsp[-1].arglist));
        (yyval.code) = res;
        free((yyvsp[-3].code));
}
#line 2136 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 619 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-3].code))+strlen((yyvsp[-1].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), (yyvsp[-3].code));
        strcat((yyval.code), "(");
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), ")");
        free((yyvsp[-3].code));
        free((yyvsp[-1].code));
}
#line 2151 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 630 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*3);
        (yyval.code)[0] = '\0';
}
#line 2160 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 634 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[-1].code));
        free((yyvsp[0].code));                        
}
#line 2173 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 643 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*3);
        (yyval.code)[0] = '\0';
}
#line 2182 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 647 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-2].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), (yyvsp[-2].code));
        strcat((yyval.code), ",");
        strcat((yyval.code), (yyvsp[0].code));                        
        free((yyvsp[-2].code));
        free((yyvsp[0].code));
}
#line 2196 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 657 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), (yyvsp[-1].code));
        if(strlen((yyvsp[0].code))>0){
            strcat((yyval.code), (yyvsp[0].code));        
        }
        
        free((yyvsp[-1].code));
        free((yyvsp[0].code));
}
#line 2212 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 668 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 2223 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 675 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "&&");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 2235 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 682 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "||");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 2247 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 689 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "!=");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 2259 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 696 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "<=");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 2271 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 703 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "+");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 2283 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 710 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "-");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 2295 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 717 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "*");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 2307 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 724 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "/");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 2319 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 731 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "[");
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), "]");
        free((yyvsp[-1].code));
}
#line 2332 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 739 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*9);
        (yyval.code)[0] = '\0';
        strcat((yyval.code), ".length");
}
#line 2342 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 744 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*3);
        (yyval.code)[0] = '\0';
}
#line 2351 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 748 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), ".");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 2363 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 756 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 2374 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 762 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*7);
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "true");
}
#line 2384 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 767 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*7);
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "false");
}
#line 2394 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 772 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 2405 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 778 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*7);
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "this");
}
#line 2415 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 783 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+20));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "new int [");
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), "]");
        free((yyvsp[-1].code));
}
#line 2428 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 791 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-2].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "new ");
        strcat((yyval.code), (yyvsp[-2].code));
        strcat((yyval.code), "()");
        free((yyvsp[-2].code));
}
#line 2441 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 799 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "!");
        strcat((yyval.code), (yyvsp[0].code));
        free((yyvsp[0].code));
}
#line 2453 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 806 "P1.y" /* yacc.c:1646  */
    {
        (yyval.code) = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+10));
        (yyval.code)[0] = '\0';
        strcat((yyval.code), "(");
        strcat((yyval.code), (yyvsp[-1].code));
        strcat((yyval.code), ")");
        free((yyvsp[-1].code));
}
#line 2466 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 815 "P1.y" /* yacc.c:1646  */
    {
        struct macro_arg_list x;
        x.count = 0;
        (yyval.arglist) = x;
}
#line 2476 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 820 "P1.y" /* yacc.c:1646  */
    {
        struct macro_arg m ;
        m.code = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+5));
        strcpy(m.code, (yyvsp[-1].code));
        struct macro_arg_list x;
        x.args[0] = m;
        x.count = 1;
        memcpy(&(x.args[1]), (yyvsp[0].arglist).args, sizeof(struct macro_arg)*(yyvsp[0].arglist).count);
        x.count += (yyvsp[0].arglist).count;
        (yyval.arglist) = x;
        free((yyvsp[-1].code));
}
#line 2493 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 833 "P1.y" /* yacc.c:1646  */
    {
        struct macro_arg_list x;
        x.count = 0;
        (yyval.arglist) = x;
}
#line 2503 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 838 "P1.y" /* yacc.c:1646  */
    {
        
        struct macro_arg m ;
        m.code = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+5));
        strcpy(m.code, (yyvsp[0].code));
        (yyvsp[-2].arglist).args[(yyvsp[-2].arglist).count++] = m;
        (yyval.arglist) = (yyvsp[-2].arglist);
        free((yyvsp[0].code));

}
#line 2518 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 855 "P1.y" /* yacc.c:1646  */
    {
        struct macro_arg_list x;
        x.count = 0;
        (yyval.arglist) = x;
}
#line 2528 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 860 "P1.y" /* yacc.c:1646  */
    {
        struct macro_arg m ;
        m.code = (char*)malloc(sizeof(char)*(strlen((yyvsp[-1].code))+5));
        strcpy(m.code, (yyvsp[-1].code));
        struct macro_arg_list x;
        x.args[0] = m;
        x.count = 1;
        memcpy(&(x.args[1]), (yyvsp[0].arglist).args, sizeof(struct macro_arg)*(yyvsp[0].arglist).count);
        x.count += (yyvsp[0].arglist).count;
        (yyval.arglist) = x;
        free((yyvsp[-1].code));
}
#line 2545 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 873 "P1.y" /* yacc.c:1646  */
    {
        struct macro_arg_list x;
        x.count = 0;
        (yyval.arglist) = x;
}
#line 2555 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 878 "P1.y" /* yacc.c:1646  */
    {
        
        struct macro_arg m ;
        m.code = (char*)malloc(sizeof(char)*(strlen((yyvsp[0].code))+5));
        strcpy(m.code, (yyvsp[0].code));
        (yyvsp[-2].arglist).args[(yyvsp[-2].arglist).count++] = m;
        (yyval.arglist) = (yyvsp[-2].arglist);
        free((yyvsp[0].code));

}
#line 2570 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 889 "P1.y" /* yacc.c:1646  */
    {
        int x = getMacroIndex((yyvsp[-6].code));
        if(x>=0){
                yyerror("// Failed to parse macrojava code.");
                return;
        }
        struct Macro m;
        strcpy(m.identifier, (yyvsp[-6].code));
        free((yyvsp[-6].code));
        strcpy(m.replace_with, (yyvsp[-1].code));
        m.arglist = (yyvsp[-4].arglist);
        m.type = 1;
        mac_table[mac_count++] = m;
        fillPos(mac_count-1);
        free((yyvsp[-1].code));
}
#line 2591 "P1.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 906 "P1.y" /* yacc.c:1646  */
    {
        int x = getMacroIndex((yyvsp[-6].code));
        if(x>=0){
                yyerror("// Failed to parse macrojava code.");
                return;
        }
        struct Macro m;
        strcpy(m.identifier, (yyvsp[-6].code));
        free((yyvsp[-6].code));
        strcpy(m.replace_with, "(");
        strcat(m.replace_with, (yyvsp[-1].code));
        strcat(m.replace_with, ")");
        m.arglist = (yyvsp[-4].arglist);
        m.type = 0;
        mac_table[mac_count++] = m;
        fillPos(mac_count-1);
        free((yyvsp[-1].code));
}
#line 2614 "P1.tab.c" /* yacc.c:1646  */
    break;


#line 2618 "P1.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 926 "P1.y" /* yacc.c:1906  */


void print(char* x) {
        printf("%s\n",x);
}
