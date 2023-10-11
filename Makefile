CONFIG=config
include $(CONFIG)
CLASSPATH=$(PO_UILIB_DIR)/po-uilib.jar:$(XXL_DIR)/xxl-core/xxl-core.jar:$(XXL_DIR)/xxl-app/xxl-app.jar
CURRENT_DIR=$(shell pwd | sed 's/ /\\ /g')
ccred="\033[0;31m\033[1m"
ccgreen="\033[0;32m\033[1m"
ccend="\033[0m"
TESTS=$(sort $(shell find tests -type f -name '*.in'))
TESTS_NUMBER=$(shell find tests -type f -name '*.in' | wc -l)
TESTS_FAILED:=$$(find tests -type f -name '*.diff' | wc -l)

.PHONY: all clean force
all: clean $(PO_UILIB_DIR)/po-uilib.jar $(XXL_DIR)/xxl-core/xxl-core.jar $(XXL_DIR)/xxl-app/xxl-app.jar $(TESTS) post-clean
	@echo
	@echo
	@if [ $(TESTS_FAILED) -gt 0 ]; \
	then \
		echo -e Tests Passed $(ccred)[$$(($(TESTS_NUMBER) - $(TESTS_FAILED)))/$(TESTS_NUMBER)]$(ccend); \
	else \
		echo -e Tests Passed $(ccgreen)[$$(($(TESTS_NUMBER) - $(TESTS_FAILED)))/$(TESTS_NUMBER)]$(ccend); \
	fi
	@echo
	@echo

# Force target to run
force:

# Compare test results
tests/%.in: force tests/%.out tests/%.run
	@-if (diff -iw -B --color tests/$*.outhyp tests/$*.out) > /dev/null; \
	then \
		echo -e $* $(ccgreen)PASSED$(ccend).; \
	else \
		echo -e $* $(ccred)FAILED$(ccend).; \
		(diff -iwu -B --color tests/$*.outhyp tests/$*.out || touch tests/$*.diff) 2> /dev/null; \
		(diff -iwu -B --color tests/$*.outhyp tests/$*.out > tests/$*.diff || touch tests/$*.diff) 2> /dev/null; \
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
	@echo >> tests/$*.outhyp


tests/%.out:
	$(error $@ is missing. Please create it.)

$(XXL_DIR)/xxl-core/xxl-core.jar: $(XXL_DIR)/xxl-core $(shell find $(XXL_DIR)/xxl-core/src -name \*.java)
	@echo xxl-core out of date. Recompiling...
	$(MAKE) -C $(XXL_DIR)/xxl-core

$(XXL_DIR)/xxl-app/xxl-app.jar: $(XXL_DIR)/xxl-app $(shell find $(XXL_DIR)/xxl-app/src -name \*.java)
	@echo xxl-app out of date. Recompiling...
	$(MAKE) -C $(XXL_DIR)/xxl-app PO_UILIB_DIR="$(PO_UILIB_DIR)"

clean:
	@$(RM) tests/*/*.outhyp
	@$(RM) tests/*.outhyp
	@$(RM) tests/*/*.diff
	@$(RM) tests/*.diff

post-clean:
	@$(RM) saved*
	

$(PO_UILIB_DIR)/po-uilib.jar:
	$(error po-uilib.jar not found in $(PO_UILIB_DIR). Please change the directory in the file: $(CONFIG).)

$(XXL_DIR)/xxl-core:
	$(error core folder not found in $(XXL_DIR). Please change the directory in the file: $(CONFIG).)

$(XXL_DIR)/xxl-app:
	$(error app folder not found in $(XXL_DIR). Please change the directory in the file: $(CONFIG).)
