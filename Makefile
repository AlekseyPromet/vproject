.PHONY: run, debug

all: run

run:
	clear | v run src

debug:
	clear | v -keepc -cg -show-c-output src