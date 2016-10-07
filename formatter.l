%{
  int tabsRequired = 0;
  void incrementTabs()
  {
    tabsRequired++;
  }

  void decrementTabs()
  {
    tabsRequired--;
  }

  void printTabs()
  {
    for(int i = 0; i <= tabsRequired; i++)
    {
      printf("    ");
    }
  }

  void openingTagPrint()
  {
   incrementTabs();
   printTabs();
   printf("%s\n", yytext);
  }

  void closingTagPrint()
  {
   printTabs();
   printf("%s\n", yytext);
   decrementTabs();
  }

 void wordPrint()
 {
  incrementTabs();
  printTabs();
  printf("%s\n", yytext);
  decrementTabs();
 }

%}

NEWLINE \n
DOCTYPE <!DOCTYPE>
WORD [a-z\.\:\ \&\;\á\é\í\ó\ú\ñA-Z0-9]*
INLINESTYLE ([a-z\ A-Z0-9]*=\"[\#a-zA-Z\ \_\&\-\:\.\/\/\0-9a-z\;]*\"*)*

HTML html
EXCEPTIONTAGS meta
INLINETAG strong|EM
TAGS head|body|div|ul|font|p|h1|h2|h3|title|li|table|th|tr|td|a|strong|EM
ANCHOR a

OHTML <{HTML}>
CHTML <\/{HTML}>
OHTMLTAG <{TAGS}>
CHTMLTAG <\/{TAGS}>
OHTMLWITHSTYLES <{TAGS}\ {INLINESTYLE}>
CEXCEPTIONS <\/{EXCEPTIONTAGS}>
OEXCEPTIONS <{EXCEPTIONTAGS}\ {INLINESTYLE}>

%%

{NEWLINE} { continue; }

{DOCTYPE} { printf("%s \n", yytext); }

{OHTML} { printf("%s \n", yytext); }

{CHTML} { printf("%s \n", yytext); }

{OHTMLTAG} { openingTagPrint(); }

{OHTMLWITHSTYLES} { openingTagPrint(); }

{OEXCEPTIONS} { wordPrint(); }

{CHTMLTAG} { closingTagPrint(); }

{WORD} { wordPrint(); }

%%

int main()
{
  yylex();
}
