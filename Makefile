CONFIG=config
include $(CONFIG)
CLASSPATH=$(PO_UILIB_DIR)/po-uilib.jar:$(XXL_DIR)/xxl-core/xxl-core.jar:$(XXL_DIR)/xxl-app/xxl-app.jar
CURRENT_DIR=$(shell pwd | sed 's/ /\\ /g')
ccred=\033[0;31m\033[1m
ccgreen=\033[0;32m\033[1m
ccyellow=\033[1;33m\033[1m
ccend=\033[0m
TESTS=$(sort $(shell find tests -type f -name '*.in'))
TESTS_NUMBER=$(shell find tests -type f -name '*.in' | wc -l)
TESTS_FAILED:=$$(find tests -type f -name '*.diff' | wc -l)
REPORT_FILE=TESTS_REPORT.log
MAKEFLAGS += --no-print-directory

.PHONY: all clean force log
all: clean $(PO_UILIB_DIR)/po-uilib.jar $(XXL_DIR)/xxl-core/xxl-core.jar $(XXL_DIR)/xxl-app/xxl-app.jar $(TESTS) post-clean
	@printf "\n\n"
	@if [ $(TESTS_FAILED) -gt 0 ]; \
	then \
                printf "$(ccred)Failed Tests:$(ccend)\n"; \
	        cat failed_tests.txt; \
		printf "Tests Passed $(ccred)[$$(($(TESTS_NUMBER) - $(TESTS_FAILED)))/$(TESTS_NUMBER)]$(ccend)\n"; \
	else \
		printf "Tests Passed $(ccgreen)[$$(($(TESTS_NUMBER) - $(TESTS_FAILED)))/$(TESTS_NUMBER)]$(ccend)\n"; \
	fi


log:
ifeq ($(QUIET),true)
	@printf "Testing in silent mode...\n";
	@(make all > $(REPORT_FILE) 2>&1);
else
	@(make all 2>&1 | tee $(REPORT_FILE));
endif
	@printf "$(ccyellow)Testing report logged in $(REPORT_FILE)$(ccend)\n";



# Force target to run
force:

# Compare test results
tests/%.in: force tests/%.out tests/%.run
	@-if (diff -iw -B --color tests/$*.outhyp tests/$*.out) > /dev/null; \
	then \
		printf "$* $(ccgreen)PASSED$(ccend).\n"; \
	else \
		printf "$* $(ccred)FAILED$(ccend).\n"; \
		(diff -iwu -B --color tests/$*.outhyp tests/$*.out || touch tests/$*.diff) 2> /dev/null; \
		(diff -iwu -B --color tests/$*.outhyp tests/$*.out > tests/$*.diff || touch tests/$*.diff) 2> /dev/null; \
		echo $* >> failed_tests.txt; \
	fi
	@echo


# Run test %
tests/%.run:
	@echo ------------------ $* ------------------
	@-if test -f "tests/$*.import"; \
	then \
		java -cp $(CLASSPATH) -Dimport=$(CURRENT_DIR)/tests/$*.import -Din=$(CURRENT_DIR)/tests/$*.in -Dout=$(CURRENT_DIR)/tests/$*.outhyp xxl.app.App; \
	else \
		java -cp $(CLASSPATH) -Din=$(CURRENT_DIR)/tests/$*.in -Dout=$(CURRENT_DIR)/tests/$*.outhyp xxl.app.App; \
	fi

tests/%.out:
	$(error $@ is missing. Please create it.)

$(XXL_DIR)/xxl-core/xxl-core.jar: $(XXL_DIR)/xxl-core $(shell find $(XXL_DIR)/xxl-core/src -name \*.java)
	@echo xxl-core possibly out of date. Recompiling...
	$(MAKE) -C $(XXL_DIR)/xxl-core

$(XXL_DIR)/xxl-app/xxl-app.jar: $(XXL_DIR)/xxl-app $(shell find $(XXL_DIR)/xxl-app/src -name \*.java)
	@echo xxl-app possibly out of date. Recompiling...
	$(MAKE) -C $(XXL_DIR)/xxl-app PO_UILIB_DIR="$(PO_UILIB_DIR)"

clean:
	@$(RM) tests/*/*.outhyp
	@$(RM) tests/*.outhyp
	@$(RM) tests/*/*.diff
	@$(RM) tests/*.diff
	@$(RM) failed_tests.txt

post-clean:
	@$(RM) saved*
	

$(PO_UILIB_DIR)/po-uilib.jar:
	$(error po-uilib.jar not found in $(PO_UILIB_DIR). Please change the directory in the file: $(CONFIG).)

$(XXL_DIR)/xxl-core:
	$(error core folder not found in $(XXL_DIR). Please change the directory in the file: $(CONFIG).)

$(XXL_DIR)/xxl-app:
	$(error app folder not found in $(XXL_DIR). Please change the directory in the file: $(CONFIG).)
