export SHELL    := /bin/bash
export BASH_ENV := ${PWD}/bash_env

.SILENT:

# Make Answers for each Puzzle
.PHONY: update-answers
update-answers:
	cp -nrT Puzzles Answers


