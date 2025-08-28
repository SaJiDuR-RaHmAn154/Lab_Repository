/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INT = 258,
     INTEGER = 259,
     FLOAT = 260,
     INPUT = 261,
     PRINT = 262,
     RETURN = 263,
     IF = 264,
     ELIF = 265,
     ELSE = 266,
     COLON = 267,
     COMMA = 268,
     SEMI = 269,
     MOD = 270,
     DIM = 271,
     AS = 272,
     FOR = 273,
     TO = 274,
     NEXT = 275,
     FUNC = 276,
     BEG = 277,
     END = 278,
     LP = 279,
     RP = 280,
     GT = 281,
     LT = 282,
     EQU = 283,
     ASSIGN = 284,
     PLUS = 285,
     MINUS = 286,
     MUL = 287,
     DIV = 288,
     ID = 289,
     STRING = 290,
     INT_NUM = 291,
     FLOAT_NUM = 292
   };
#endif
/* Tokens.  */
#define INT 258
#define INTEGER 259
#define FLOAT 260
#define INPUT 261
#define PRINT 262
#define RETURN 263
#define IF 264
#define ELIF 265
#define ELSE 266
#define COLON 267
#define COMMA 268
#define SEMI 269
#define MOD 270
#define DIM 271
#define AS 272
#define FOR 273
#define TO 274
#define NEXT 275
#define FUNC 276
#define BEG 277
#define END 278
#define LP 279
#define RP 280
#define GT 281
#define LT 282
#define EQU 283
#define ASSIGN 284
#define PLUS 285
#define MINUS 286
#define MUL 287
#define DIV 288
#define ID 289
#define STRING 290
#define INT_NUM 291
#define FLOAT_NUM 292




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 12 "parser.y"
{
    int int_val;
    float float_val;
    char str_val[124];
}
/* Line 1529 of yacc.c.  */
#line 129 "./out/parser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

