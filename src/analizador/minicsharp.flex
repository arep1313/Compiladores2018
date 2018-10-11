package analizador;
import static analizador.Token.*;
import java_cup.runtime.*;
%%                                      /*DEFINICIONES*/
%class Lexer                            /*LA CLASE QUE SE GENERARA SE LLAMA "LEXER" Y ESCRIBE CODIGO AHI*/
          /* %type java_cup.runtime.Symbol                             LOS VALORES SE RETORNAN DE TIPO "TOKEN" */
%line
%column
%cup
%{
    public int linea(){return yyline;}
    public int column() {return yycolumn;}
    public Symbol token( int tokenType ) {   System.err.println(     "Obtain token " + sym.terminalNames[tokenType]     + " \"" + yytext() + "\"" );   return new Symbol( tokenType, yychar,     yychar + yytext().length(), yytext() );   } 
%}
LETRA = [a-zA-Z_]
DIGITO = [0-9]
ENTERO = ({DIGITO}+)
P = [(){}\[\]]       /*Que significa esto*/
WHITE = [ \t\n\r]

ENTER = ("\n")
HEXADECIMAL = (0("X"|"x")[0-9a-fA-F]+)
COMENTARIO = ("//"[^\n]*) | "/*" ~"*/"
ERRORC = "/*"[^"*/"]*
CADENA = ("\""[^\n]*"\"")
CDOUBLE = {DIGITO}+("."){DIGITO}*(([E|e]("+"|"-")?)?{DIGITO}+)*

BOOLEAN =("true")|("false")
VOID = ("void")
INT = ("int")
DOUBLE = ("double")
BOOL = ("bool")
STRING = ("string")
CLASS = ("class")
INTERFACE = ("interface")
NULL = ("null")
THIS = ("this")
EXTENDS = ("extends")
IMPLEMENTS = ("implements")
FOR = ("for")
WHILE = ("while")
IF = ("if")
ELSE = ("else")
RETURN = ("return")
BREAK = ("break")
NEW = ("New")
NEWA = ("NewArray")
PRINT = ("Print")
READINTEGER = ("ReadInteger")
READLINE = ("READLINE")
MALLOC = ("Malloc")
GETBYTE = ("GetByte")
SETBYTE = ("SetByte")

%{
public String lexeme;
%}
%%
{WHITE} {/*Ignore*/}
{COMENTARIO} {/*Ignore*/}
"+" {lexeme=yytext();return token(sym.OMAS);}
"-" {lexeme=yytext();return token(sym.OMENOS);}
"*" {lexeme=yytext();return token(sym.OMULT);}
"/" {lexeme=yytext();return token(sym.ODIV);}
"%" {lexeme=yytext();return token(sym.OPORC);}
"<" {lexeme=yytext();return token(sym.MENOR);}
"<=" {lexeme=yytext();return token(sym.MENORIGUAL);}
">" {lexeme=yytext();return token(sym.MAYOR);}
">=" {lexeme=yytext();return token(sym.MAYORIGUAL);}
"=" {lexeme=yytext();return token(sym.ASIG);}
"==" {lexeme=yytext();return token(sym.IGUAL);}
"!=" {lexeme=yytext();return token(sym.NOIGUAL);}
"&" {lexeme=yytext();return token(sym.AND);}
"||" {lexeme=yytext();return token(sym.OR);}
"!" {lexeme=yytext();return token(sym.NEGACION);}
";" {lexeme=yytext();return token(sym.FIN);}
"," {lexeme=yytext();return token(sym.COMA);}
"[]" {lexeme=yytext();return token(sym.CORCHETESC);}
"()" {lexeme=yytext();return token(sym.PARENTESIS);}
"{}" {/*Ignore*/}
"." {lexeme=yytext();return token(sym.PUNTO);}
"[" {lexeme=yytext();return token(sym.ICORCH);}
"]" {lexeme=yytext();return token(sym.FCORCH);}
"(" {lexeme=yytext();return token(sym.IPAR);}
")" {lexeme=yytext();return token(sym.FPAR);}
"{" {lexeme=yytext();return token(sym.ICORCH2);}
"}" {lexeme=yytext();return token(sym.FCORCH2);}

{CDOUBLE} {lexeme=yytext(); return token(sym.CDOUBLE);}
{ENTERO} {lexeme=yytext(); return token(sym.ENTERO);}
{HEXADECIMAL} {/*Ignore*/}
{BOOLEAN} {lexeme=yytext(); return token(sym.BOOLEAN);}
{VOID} {lexeme=yytext(); return token(sym.VOID);}
{INT} {lexeme=yytext(); return token(sym.INT);}
{DOUBLE} {lexeme=yytext(); return token(sym.DOUBLE);}
{BOOL} {lexeme=yytext(); return token(sym.BOOL);}
{STRING} {lexeme=yytext(); return token(sym.STRING);}
{CLASS} {lexeme=yytext(); return token(sym.CLASS);}
{INTERFACE} {lexeme=yytext(); return token(sym.INTERFACE);}
{NULL} {lexeme=yytext(); return token(sym.NULL);}
{THIS} {lexeme=yytext(); return token(sym.THIS);}
{EXTENDS} {lexeme=yytext(); return token(sym.EXTENDS);}
{IMPLEMENTS} {lexeme=yytext(); return token(sym.IMPLEMENTS);}
{FOR} {lexeme=yytext(); return token(sym.FOR);}
{WHILE} {lexeme=yytext(); return token(sym.WHILE);}
{IF} {lexeme=yytext(); return token(sym.IF);}
{ELSE} {lexeme=yytext(); return token(sym.ELSE);}
{RETURN} {lexeme=yytext(); return token(sym.RETURN);}
{BREAK} {lexeme=yytext(); return token(sym.BREAK);}
{NEW} {lexeme=yytext(); return token(sym.NEW);}
{NEWA} {lexeme=yytext(); return token(sym.NEWA);}
{ERRORC} {lexeme="Error, no se han cerrado los comentarios."; return null;}
{CADENA} {lexeme=yytext(); return token(sym.CADENA);}
{LETRA}({LETRA}|{DIGITO})* {lexeme=yytext(); return token(sym.IDENT);}

. {lexeme=yytext(); return token(sym.error);}
