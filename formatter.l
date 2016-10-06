%{
  int num_lines = 0;
%}

%%
\n ++num_lines;
%%

int main()
{
  yylex();
  printf( "# of lines = %d \n", num_lines);
}
