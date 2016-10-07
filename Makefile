build:
	flex formatter.l
	gcc -o formatter lex.yy.c -ll

run: build
	./formatter < index.html > formatted.html

clean:
	rm formatter
	rm lex.yy.c
