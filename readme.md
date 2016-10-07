## Flex Hw

### Compiling
```console
make build
```

### Run
By default, ```make build``` will output an executable named ```formatter```, then just do
```console
./formatter
```
to start the application.

### Clean
```console
make clean
```
Will remove the executable and the ```lex``` file.

### Compile and Run
```console
make run
```
This command depends on ```build```, so every time you run ```run``` _(duh)_ you build it as well. ^_^

If you're using cygwin just change ```gcc -o formatter lex.yy.c -ll``` to ```gcc -o formatter lex.yy.c -lfl```.

### Starting out with flex.

A flex file (extension ```.l```) has 3 main sections:

* definitions
* rules
* user code

#### Definitions

This is where you'll write things like patterns to match against. In this example, we want to match all the ```html``` tags in an ```html``` document, so we do:

```
TAGS html|head|body|title|meta|p|h1|h2|h3|h4|h5|h6|div|ul|ol|li
OHTML <{TAGS}>
CHTML <\/{TAGS}>
```
We set one definition for ```TAGS``` which maps (the most mainstream) html tags, separated by a ```|```.

We set ```OHTML``` as _Opening HTML_, we need to match against the literal tag, so we use ```<{TAGS}>``` where ```<>``` is any HTML syntax and ```{TAGS}``` is the actual placemant of any TAGS defined.

We do the same for ```CTHML```.

We can do different things, what about varibales?
```
VARS [a-z][a-z0-9]*
```
Anything starting with a letter, followed by a letter or number _n_ times counts.

Digits
```
DIGITS [0-9]
```

We can ember these rules in the rules below.

### Rules
Rules go below a ```%%``` (double percentage symbol). This is where we want to actually do things. We set an initial rule bound to an action:
```
{OTHTML} { printf("An opening html tag %s was found \n", yytext); }
```
Which does exactly what we would expect it to do, if we find any opening html tags, we print to the console which html was found (mapped in ```yytext``` variable).

We do the same for ```CHTML```.

We can do this for many things, and we can run actual code, like functions.
Example:

```c
%{
  void printUserName()
  {
    printf("Oscar!");
  }
%}

%%
username printUserName();
```
When we type ```username``` when executing the program, we'll see _Oscar!_ instead.

### User Code

### Escaping characters
This was tricky, imagine having a ```p``` tag, which was many words, you need to detect them all at once. we need to escape a ``` ``` character.
We do
```
WORD [a-zA-Z\ 0-9]*
```
if you look closely we can see ```\ ```, this means that a _space_ is matched, and counted as a word, that means ```hello world``` would match against WORD.

You can do this with ```\" content here \"``` to escape double quotes, etc.

### Running with an external file
we can run a make task
```
make run_example
```
which grabs an example file and runs it through and outputs the result.
You can change this directly in the Makefile to adjust your needs.

### Generatign an external file
Put this in your makefile 
```
./formatter < index.html > formatted.html
```
the last section ```> formatted.html``` will create a new file based on the terminal output.

### Actual HW
Checkout the ```index.html``` provided, notice how some elements, such as ```meta```, ```title```, and ```p``` are indented inside other tags. These tags open and close, such as ```<p> </p>```. Essentially, the script must indent _anything_ that's inside the ```html``` tags. Indents are 2-spaces tabs.

### Contributing

1. Clone (git clone git@github.com:oelizondo/flex_hw.git)
2. Make changes
3. Add changes (git add -A)
4. Commit changes (git commit -m "my comment")
5. Push changes (git push origin master)