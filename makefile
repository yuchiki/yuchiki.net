#!/usr/bin/make -f

.PHONY: test
test:
	haml-lint
	htmlhint
	sass-lint --max-warnings 1 -v