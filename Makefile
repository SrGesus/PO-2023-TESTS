CONFIG=config
include $(CONFIG)
CLASSPATH=$(PO_UILIB_DIR)/po-uilib.jar:$(XXL_DIR)/xxl-core/xxl-core.jar:$(XXL_DIR)/xxl-app/xxl-app.jar
CURRENT_DIR=$(shell pwd | sed 's/ /\\ /g')
ccred="\033[0;31m\033[1m"
ccyellow="\033[0;32m\033[1m"
ccend="\033[0m"

all: $(PO_UILIB_DIR)/po-uilib.jar $(XXL_DIR) $(XXL_DIR)/xxl-core/xxl-core.jar $(XXL_DIR)/xxl-app/xxl-app.jar $(wildcard tests/*/*.in) $(wildcard tests/*.in) clean

# Force target to run
force:

tests/%.in: tests/%.out force
	@-if test -f "tests/$*.import"; \
	then \
		java -cp $(CLASSPATH) -Dimport=$(CURRENT_DIR)/tests/$*.import -Din=$(CURRENT_DIR)/tests/$*.in -Dout=$(CURRENT_DIR)/tests/$*.outhyp xxl.app.App; \
	else \
		java -cp $(CLASSPATH) -Din=$(CURRENT_DIR)/tests/$*.in -Dout=$(CURRENT_DIR)/tests/$*.outhyp xxl.app.App; \
	fi

	@-if test -z "$$(diff -iw --color tests/$*.out tests/$*.outhyp)"; \
	then \
		echo -e $* $(ccyellow)PASSED$(ccend).; \
	else \
		echo -e $* $(ccred)FAILED$(ccend).; \
		diff -iwu --color tests/$*.out tests/$*.outhyp; \
	fi

tests/%.out:
	$(error $@ is missing. Please create it.)

$(XXL_DIR)/xxl-core/xxl-core.jar: $(wildcard xxl-core/src/xxl/*.java) $(wildcard xxl-core/src/xxl/*/*.java)
	@echo xxl-core out of date. Recompiling...
	$(MAKE) -C $(XXL_DIR)/xxl-core PO_UILIB_DIR="$(PO_UILIB_DIR)"

$(XXL_DIR)/xxl-app/xxl-app.jar: $(wildcard xxl-app/src/xxl/app/*.java) $(wildcard xxl-app/src/xxl/app/*/*.java)
	@echo xxl-app out of date. Recompiling...
	$(MAKE) -C $(XXL_DIR)/xxl-app PO_UILIB_DIR="$(PO_UILIB_DIR)"

clean:
	@$(RM) tests/*/*.outhyp
	@$(RM) tests/*.outhyp
	

$(PO_UILIB_DIR)/po-uilib.jar:
	$(error po-uilib.jar not found in $(PO_UILIB_DIR). Please change the directory in the file: $(CONFIG).)

$(XXL_DIR):
	$(error project folder not found in $(XXL_DIR). Please change the directory in the file: $(CONFIG).)
