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
COMENTARIO = ("//"[^\n]*) | ("/*".*"*/")
CADENA = ("\""[^\n]*"\"")

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
"+" {return OMAS;}
"-" {return OMENOS;}
"*" {return OMULT;}
"/" {return ODIV;}
"%" {return OPORC;}
"<" {return MENOR;}
"<=" {return MENORIGUAL;}
">" {return MAYOR;}
">=" {return MAYORIGUAL;}
"=" {return ASIG;}
"==" {return IGUAL;}
"!=" {return NOIGUAL;}
"&&" {return AND;}
"||" {return OR;}
"!" {return NEGACION;}
";" {return FIN;}
"," {return COMA;}
"." {return PUNTO;}
"[" {return ICORCH;}
"]" {return FCORCH;}
"(" {return IPAR;}
")" {return FPAR;}
"{" {return ICORCH2;}
"}" {return FCORCH2;}
"[]" {return CORCHETESC;}
"()" {return PARENTESIS;}
"{}" {return CORCHETES;}


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
{CADENA} {lexeme=yytext(); return CADENA;}
{LETRA}({LETRA}|{DIGITO})* {lexeme=yytext(); return ID;}

. {return ERROR;}
