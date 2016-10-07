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

%}

WORD [a-zA-Z\ 0-9]*
INLINESTYLE [a-zA-Z0-9]*=\"[\#a-z0-9]*\"*
DOCTYPE <!DOCTYPE>

TAGS html|head|body|div|ul|font|p|h1|h2|h3|title|li|table|th|tr|td
EXCEPTIONTAGS strong|EM|meta
HTML html

OHTML <{TAGS}>
OHTMLWITHSTYLES <{TAGS}\ {INLINESTYLE}>
CHTML <\/{TAGS}>

OEXCEPTIONS <{EXCEPTIONTAGS}\ {INLINESTYLE}>
CEXCEPTIONS <\/{EXCEPTIONTAGS}>

%%
{DOCTYPE} {
            continue;
          }

{OHTML} { 
          incrementTabs();
          printTabs();
          printf("%s\n", yytext);
        }

{OHTMLWITHSTYLES} {
                    incrementTabs();
                    printTabs();
                    printf("%s\n", yytext);
                  }

{CHTML} { 
          printTabs();
          printf("%s", yytext);
          decrementTabs();
        }

{WORD} { 
          incrementTabs();
          printTabs();
          printf("%s\n", yytext);
          decrementTabs();
        }


%%

int main()
{
  yylex();
}
