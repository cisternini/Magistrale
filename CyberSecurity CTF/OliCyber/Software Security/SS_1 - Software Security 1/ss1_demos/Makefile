SRCDIR := src
BINDIR := bin

SOURCES := $(wildcard $(SRCDIR)/*.c)
TARGETS := $(patsubst $(SRCDIR)/%.c,$(BINDIR)/%,$(SOURCES))

.SUFFIXES:
.DELETE_ON_ERROR:

all: $(TARGETS)
.PHONY: all

$(BINDIR):
	@mkdir -p $@

$(BINDIR)/%: $(SRCDIR)/%.c | $(BINDIR)
	@echo CC $@
	@$(CC) -o $@ $<

clean:
	rm -rf $(BINDIR)
.PHONY: clean
