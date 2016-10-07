build:
	flex formatter.l
	gcc -o formatter lex.yy.c -ll

run: build
	./formatter

run_example: build
	./formatter < example.html

clean:
	rm formatter
	rm lex.yy.c
