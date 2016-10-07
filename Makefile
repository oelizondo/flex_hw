build:
	flex formatter.l
	gcc -o formatter lex.yy.c -ll

run: build
	./formatter

run_example: build
	./formatter < example.html

run_example2: build
	./formatter < example2.html
clean:
	rm formatter
	rm lex.yy.c
