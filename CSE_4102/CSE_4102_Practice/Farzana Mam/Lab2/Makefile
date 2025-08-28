main: cal.l cal.y
	bison -d cal.y
	flex cal.l
	gcc cal.tab.c lex.yy.c -o cal
	./cal <inp.txt> oup.txt

main2: prog.l prog.y
	bison -d prog.y
	flex prog.l
	gcc prog.tab.c lex.yy.c -o prog
	./prog <input.txt> output.txt

clean:
	rm -f *.tab.c *.tab.h lex.yy.c cal prog a.out output.txt