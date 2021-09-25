TAG :=$(shell git describe --exact-match --tags $(git log -n1 --pretty='%h'))

ifeq "$(TAG)" "''"
TAG="??? unknown ???"
endif

build:
	pdflatex  -file-line-error -interaction=nonstopmode -recorder  "\newcommand\documentVersion[1]{"$(TAG)"}\input{main.tex}"
