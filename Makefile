all:
	@for file in section*.pl; do \
		echo "Testing $$file"; \
		swipl -g run_tests -t halt "$$file"; \
	done