package analizador;
import static analizador.Token.*;
%%                                      /*DEFINICIONES*/
%class Lexer                            /*LA CLASE QUE SE GENERARA SE LLAMA "LEXER" Y ESCRIBE CODIGO AHI*/
%type Token                             /*LOS VALORES SE RETORNAN DE TIPO "TOKEN" */
%line
%column
%{
    public int linea(){return yyline;}
    public int column() {return yycolumn;}
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

%{
public String lexeme;
%}
%%
{WHITE} {/*Ignore*/}
{COMENTARIO} {return COMENTARIO;}
"+" {lexeme=yytext();return OMAS;}
"-" {lexeme=yytext();return OMENOS;}
"*" {lexeme=yytext();return OMULT;}
"/" {lexeme=yytext();return ODIV;}
"%" {lexeme=yytext();return OPORC;}
"<" {lexeme=yytext();return MENOR;}
"<=" {lexeme=yytext();return MENORIGUAL;}
">" {lexeme=yytext();return MAYOR;}
">=" {lexeme=yytext();return MAYORIGUAL;}
"=" {lexeme=yytext();return ASIG;}
"==" {lexeme=yytext();return IGUAL;}
"!=" {lexeme=yytext();return NOIGUAL;}
"&&" {lexeme=yytext();return AND;}
"||" {lexeme=yytext();return OR;}
"!" {lexeme=yytext();return NEGACION;}
";" {lexeme=yytext();return FIN;}
"," {lexeme=yytext();return COMA;}
"[]" {lexeme=yytext();return CORCHETESC;}
"()" {lexeme=yytext();return PARENTESIS;}
"{}" {lexeme=yytext();return CORCHETES;}
"." {lexeme=yytext();return PUNTO;}
"[" {lexeme=yytext();return ICORCH;}
"]" {lexeme=yytext();return FCORCH;}
"(" {lexeme=yytext();return IPAR;}
")" {lexeme=yytext();return FPAR;}
"{" {lexeme=yytext();return ICORCH2;}
"}" {lexeme=yytext();return FCORCH2;}

{CDOUBLE} {lexeme=yytext(); return CDOUBLE;}
{ENTERO} {lexeme=yytext(); return ENTERO;}
{HEXADECIMAL} {lexeme=yytext(); return HEXADECIMAL;}
{BOOLEAN} {lexeme=yytext(); return BOOLEAN;}
{VOID} {lexeme=yytext(); return VOID;}
{INT} {lexeme=yytext(); return INT;}
{DOUBLE} {lexeme=yytext(); return DOUBLE;}
{BOOL} {lexeme=yytext(); return BOOL;}
{STRING} {lexeme=yytext(); return STRING;}
{CLASS} {lexeme=yytext(); return CLASS;}
{INTERFACE} {lexeme=yytext(); return INTERFACE;}
{NULL} {lexeme=yytext(); return NULL;}
{THIS} {lexeme=yytext(); return THIS;}
{EXTENDS} {lexeme=yytext(); return EXTENDS;}
{IMPLEMENTS} {lexeme=yytext(); return IMPLEMENTS;}
{FOR} {lexeme=yytext(); return FOR;}
{WHILE} {lexeme=yytext(); return WHILE;}
{IF} {lexeme=yytext(); return IF;}
{ELSE} {lexeme=yytext(); return ELSE;}
{RETURN} {lexeme=yytext(); return RETURN;}
{BREAK} {lexeme=yytext(); return BREAK;}
{NEW} {lexeme=yytext(); return NEW;}
{NEWA} {lexeme=yytext(); return NEWA;}
{ERRORC} {lexeme="Error, no se han cerrado los comentarios."; return null;}
{CADENA} {lexeme=yytext(); return CADENA;}
{LETRA}({LETRA}|{DIGITO})* {lexeme=yytext(); return ID;}

. {lexeme=yytext(); return ERROR;}
