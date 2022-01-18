package fes.aragon.compilador;
import java_cup.runtime.Symbol;
import java.io.Reader;
%%
%{
	public int getYyline() {
                return yyline;
        }

        public int getYy_currentPos() {
            return yy_currentPos-1;
        }
%}
%class Lexico
%public
%line
%cup
%type java_cup.runtime.Symbol
//%implements java_cup.runtime.Scanner
%eofval{
return new Symbol(sym.EOF,new String("Fin del archivo"));
//return null;
%eofval}
DIGITO=[0-9]
LETRA= [a-zA-Z]
ID={LETRA}({LETRA}|{DIGITO})*
%%
";" {System.out.println("Puntoycoma"); return new Symbol(sym.PUNTOYCOMA); }
"true" {System.out.println("true"); return new Symbol(sym.TRUE); }
"false" {System.out.println("false"); return new Symbol(sym.FALSE); }
"or" {System.out.println("or"); return new Symbol(sym.OR); }
"and" {System.out.println("and"); return new Symbol(sym.AND); }
"not" {System.out.println("not"); return new Symbol(sym.NOT); }
"(" {System.out.println("CierreI"); return new Symbol(sym.CIERREI); }
")" {System.out.println("CierreD"); return new Symbol(sym.CIERRED); }



[\t\r\f]  {}
[\n] {}
" " {System.out.println("Simbolo ."+yytext());}
. { System.out.println("Caracter no valido. "+yytext()+"-"); }


