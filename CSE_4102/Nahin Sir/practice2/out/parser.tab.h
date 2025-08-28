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
     CHAR = 258,
     INT = 259,
     DOUBLE = 260,
     IF = 261,
     ELSE = 262,
     WHILE = 263,
     FOR = 264,
     CONTINUE = 265,
     BREAK = 266,
     VOID = 267,
     RETURN = 268,
     PRINTF = 269,
     ADDOP = 270,
     SUBOP = 271,
     MULOP = 272,
     DIVOP = 273,
     INCR = 274,
     DECR = 275,
     OROP = 276,
     ANDOP = 277,
     NOTOP = 278,
     EQUOP = 279,
     NEQUOP = 280,
     GTEQ = 281,
     GT = 282,
     LTEQ = 283,
     LT = 284,
     LPAREN = 285,
     RPAREN = 286,
     LBRACE = 287,
     RBRACE = 288,
     SEMI = 289,
     ASSIGN = 290,
     COMMA = 291,
     ID = 292,
     ICONST = 293,
     FCONST = 294,
     CCONST = 295,
     STRING = 296
   };
#endif
/* Tokens.  */
#define CHAR 258
#define INT 259
#define DOUBLE 260
#define IF 261
#define ELSE 262
#define WHILE 263
#define FOR 264
#define CONTINUE 265
#define BREAK 266
#define VOID 267
#define RETURN 268
#define PRINTF 269
#define ADDOP 270
#define SUBOP 271
#define MULOP 272
#define DIVOP 273
#define INCR 274
#define DECR 275
#define OROP 276
#define ANDOP 277
#define NOTOP 278
#define EQUOP 279
#define NEQUOP 280
#define GTEQ 281
#define GT 282
#define LTEQ 283
#define LT 284
#define LPAREN 285
#define RPAREN 286
#define LBRACE 287
#define RBRACE 288
#define SEMI 289
#define ASSIGN 290
#define COMMA 291
#define ID 292
#define ICONST 293
#define FCONST 294
#define CCONST 295
#define STRING 296




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 10 "parser.y"
{
    char str_val[100];
    int int_val;
}
/* Line 1529 of yacc.c.  */
#line 136 "./out/parser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

