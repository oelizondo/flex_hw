## Flex Hw

### Compiling
```console
make build
```

If you're using cygwin just change ```gcc -o formatter lex.yy.c -ll``` to ```gcc -o formatter lex.yy.c -lfl```.

### Usage
By default, ```make build``` will output an executable named ```formatter```, then just do
```console
./formatter
```
to start the application.

### Contributing

1. Clone (git clone git@github.com:oelizondo/flex_hw.git)
2. Make changes
3. Add changes (git add -A)
4. Commit changes (git commit -m "my comment")
5. Push changes (git push origin master)