%{
  int tabsRequired = 0;
%}

VAR [a-z][a-z0-9]*
TAGS html|head|body|title|meta|p|h1|h2|h3|h4|h5|h6|div|ul|ol|li
OHTML <{TAGS}>
CHTML <\/{TAGS}>

%%
{OHTML} { printf("An opening html tag %s was found \n", yytext); }
{CHTML} { printf("A closing html tag %s was found \n", yytext); }
%%

int main()
{
  yylex();
}
