build:
	flex formatter.l
	gcc -o formatter lex.yy.c -ll

clean:
	rm formatter
