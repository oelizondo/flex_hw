build:
	flex formatter.l
	gcc -o formatter lex.yy.c -ll

run: build
	./formatter

clean:
	rm formatter
	rm lex.yy.c
