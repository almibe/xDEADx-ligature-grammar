lexer grammar ModalSparqlLexer;

PNAME_NS
  : PN_PREFIX? ':'
;

PNAME_LN
  : PNAME_NS PN_LOCAL
;

BLANK_NODE_LABEL
  : '_:' ( PN_CHARS_U | [0-9] ) ((PN_CHARS|'.')* PN_CHARS)?
;

VAR1
  : '?' VARNAME
;

VAR2
  : '$' VARNAME
;

LANGTAG
  : '@' [a-zA-Z]+ ('-' [a-zA-Z0-9]+)*
;

INTEGER
  : [0-9]+
;

DECIMAL
  : [0-9]* '.' [0-9]+
;

DOUBLE
  :	[0-9]+ '.' [0-9]* EXPONENT | '.' ([0-9])+ EXPONENT | ([0-9])+ EXPONENT
;

INTEGER_POSITIVE
  :	'+' INTEGER
;


DECIMAL_POSITIVE
  :	'+' DECIMAL
;

DOUBLE_POSITIVE
  : '+' DOUBLE
;

INTEGER_NEGATIVE
  :	'-' INTEGER
;

DECIMAL_NEGATIVE
  : '-' DECIMAL
;

DOUBLE_NEGATIVE
  : '-' DOUBLE
;

EXPONENT
  : [eE] [+-]? [0-9]+
;

STRING_LITERAL1
  : '\'' ( ([^#x27#x5C#xA#xD]) | ECHAR )* '\''
;

STRING_LITERAL2
  : '"' ( ([^#x22#x5C#xA#xD]) | ECHAR )* '"'
;

STRING_LITERAL_LONG1
  : '\'\'\'' ( ( '\'' | '\'\'' )? ( [^'\] | ECHAR ) )* "'''"
;

STRING_LITERAL_LONG2
  : '"""' ( ( '"' | '""' )? ( [^"\] | ECHAR ) )* '"""'
;

ECHAR
  : '\' [tbnrf\"']
;

NIL
  :'(' WS* ')'
;

WS
  : #x20 | #x9 | #xD | #xA
;

ANON
  : '[' WS* ']'
;

PN_CHARS_BASE
  : [A-Z]
  | [a-z]
  | [#x00C0-#x00D6]
  | [#x00D8-#x00F6]
  | [#x00F8-#x02FF]
  | [#x0370-#x037D]
  | [#x037F-#x1FFF]
  | [#x200C-#x200D]
  | [#x2070-#x218F]
  | [#x2C00-#x2FEF]
  | [#x3001-#xD7FF]
  | [#xF900-#xFDCF]
  | [#xFDF0-#xFFFD]
  | [#x10000-#xEFFFF]
;

PN_CHARS_U
  : PN_CHARS_BASE
  | '_'
;

VARNAME
  : ( PN_CHARS_U | [0-9] ) ( PN_CHARS_U | [0-9] | #x00B7 | [#x0300-#x036F] | [#x203F-#x2040] )*
;

PN_CHARS
  : PN_CHARS_U | '-' | [0-9] | #x00B7 | [#x0300-#x036F] | [#x203F-#x2040]
;

PN_PREFIX
  : PN_CHARS_BASE ((PN_CHARS|'.')* PN_CHARS)?
;

PN_LOCAL
  : (PN_CHARS_U | ':' | [0-9] | PLX ) ((PN_CHARS | '.' | ':' | PLX)* (PN_CHARS | ':' | PLX) )?
;

PLX
  : PERCENT
  | PN_LOCAL_ESC
;

PERCENT
  : '%' HEX HEX
;

HEX
  : [0-9]
  | [A-F]
  | [a-f]
;

PN_LOCAL_ESC
  : '\'' ( '_' | '~' | '.' | '-' | '!' | '$' | '&' | | '(' | ')' | '*' | '+' | ',' | ';' | '=' | '/' | '?' | '#' | '@' | '%' )
;
