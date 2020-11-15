header {
  package edu.mit.compilers.grammar;
}

options
{
  mangleLiteralPrefix = "TK_";
  language = "Java";
}

{@SuppressWarnings("unchecked")}
class DecafScanner extends Lexer;
options
{
  k = 2;
}

tokens 
{
  "class";
  "bool";
  "break";
  "import";
  "continue";
  "else";
  "false";
  "for";
  "while";
  "if";
  "int";
  "return";
  "len";
  "true";
  "void";
}

// Selectively turns on debug tracing mode.
// You can insert arbitrary Java code into your parser/lexer this way.
{
  /** Whether to display debug information. */
  private boolean trace = false;

  public void setTrace(boolean shouldTrace) {
    trace = shouldTrace;
  }
  @Override
  public void traceIn(String rname) throws CharStreamException {
    if (trace) {
      super.traceIn(rname);
    }
  }
  @Override
  public void traceOut(String rname) throws CharStreamException {
    if (trace) {
      super.traceOut(rname);
    }
  }
}

LCURLY options          { paraphrase = "{"; }  : "{";
RCURLY options          { paraphrase = "}"; }  : "}";
SEMICOLON options       { paraphrase = ";"; }  : ';';
COMMA options           { paraphrase = ","; }  : ',';
LSQUARE options         { paraphrase = "["; }  : "[";
RSQUARE options         { paraphrase = "]"; }  : "]";
LPAREN options          { paraphrase = "("; }  : "(";
RPAREN options          { paraphrase = ")"; }  : ")";
QUESTION options        { paraphrase = "?"; }  : "?";
AT options              { paraphrase = "@"; }  : "@";
COLON options           { paraphrase = ":"; }  : ":";

MINUS options           { paraphrase = "-"; }  : "-";
PLUS options            { paraphrase = "+"; }  : "+";
STAR options            { paraphrase = "*"; }  : "*";
SLASH options           { paraphrase = "/"; }  : "/";
PERCENT options         { paraphrase = "%"; }  : "%";
ASSIGN options          { paraphrase = "="; }  : "=";
EXCLAM options          { paraphrase = "!"; }  : "!";

REL_OP             : ('<' | '>' | "<=" | ">=");
EQ_OP              : ("==" | "!=");
AND_OP             : "&&";
OR_OP              : "||";
COMPOUND_ASSIGN_OP : ("+=" | "-=");
INCREMENT_OP       : "++";
DECREMENT_OP       : "--"; 

ID options { paraphrase = "an identifier"; } : ALPHA (ALPHA_NUM)*;
INTLITERAL options { paraphrase = "an int literal"; } : DECIMAL_LITERAL | HEX_LITERAL;
CHARLITERAL options { paraphrase = "a char literal"; } : '\'' CHAR '\'';
STRINGLITERAL options { paraphrase = "a string literal"; } : '"' (CHAR)* '"';

// Note that here, the {} syntax allows you to literally command the lexer
// to skip mark this token as skipped, or to advance to the next line
// by directly adding Java commands.
WS_ : (' ' | '\t' | '\n' {newline();}) {_ttype = Token.SKIP; };
BLOCK_COMMENT : "/*" (options {greedy=false;} :.)* "*/";
// Operator ~ used to invert a character or set of characters.
SL_COMMENT : "//" (~'\n')* '\n' {_ttype = Token.SKIP; newline (); };

// Protected rule does not result in a token object that is passed to the
// parser.
protected CHAR               : (' '..'!' | '#'..'&' | '('..'[' | ']'..'~' | ESC);
protected ESC                : '\\' ( '"' | '\'' | '\\' | 't' | 'n' );
protected ALPHA              : ('a'..'z' | 'A'..'Z' | '_');
protected DIGIT              : '0'..'9';
protected ALPHA_NUM          : (ALPHA | DIGIT);
protected HEX_DIGIT          : (DIGIT | 'a'..'f' | 'A'..'F');
protected DECIMAL_LITERAL    : (DIGIT)+;
protected HEX_LITERAL        : "0x" (HEX_DIGIT)+;
