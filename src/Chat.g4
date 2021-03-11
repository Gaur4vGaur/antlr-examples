grammar Chat;

/* Parser Rules */

chat: line+ EOF;
line: name command message NEWLINE;

message: (emoticon | link | color | mention | WORD | WHITESPACE)+; 
name: WORD WHITESPACE;
command: (SAYS|SHOUTS) ':' WHITESPACE;


emoticon: ':' '-'? ')' 
        | ':' '-'? '('
        ;

link: TEXT TEXT;

color            : '/' WORD '/' message '/'; 
mention          : '@' WORD ;


/* Lexer Rules */

fragment S: ('S'|'s');
fragment A: ('A'|'a');
fragment Y: ('Y'|'y');
fragment H: ('H'|'h');
fragment O: ('O'|'o');
fragment U: ('U'|'u');
fragment T: ('T'|'t');

SAYS                : S A Y S;
SHOUTS                : S H O U T S;

fragment DIGIT: [0-9];
fragment NUMBER: DIGIT+([,.]DIGIT+)?;

fragment UPPERCASE: [A-Z];
fragment LOWERCASE: [a-z];

WORD: (UPPERCASE|LOWERCASE|'_')+;
WHITESPACE      : (' ' | '\t') ; 
NEWLINE         : ('\r'? '\n' | '\r')+ ;
TEXT            : ('['|'(') ~[\])]+  (']'|')');
