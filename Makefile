all:
	@for file in *.pl; do \
		echo "Testing $$file"; \
		swipl -g run_tests -t halt "$$file"; \
	done